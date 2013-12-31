class Location < ActiveRecord::Base
  attr_accessible :unique_number_id, :postal_code, :tracking_number, :lat, :lng

  belongs_to :unique_number, counter_cache: true

  after_create :increment_box_counter
  after_destroy :decrement_box_counter
  before_save :update_latlng

  def self.import(file)
    #number of locations updated
    ct = 0

    CSV.foreach(file.path, headers: true) do |row|
      #Eco ReBox uid number
      erb = row['ShipToAddress3'].to_s.split('-')[0] || 
            row['Ship To Address Line 3'].to_s.split('-')[0]
      erb = UniqueNumber.where(uin: erb)
      #tracking number
      tn = row['PackageTrackingNumber'] || 
           row['Tracking Number']
      tn_exists = self.where(tracking_number: tn)
      #postal code
      pc = row['ShipToPostalCode'] || 
           row['Ship To Postal Code']
      
      if !tn_exists && erb
        loc = self.create! unique_number_id: erb.id, 
                           postal_code: pc,
                           tracking_number: tn
        ct += 1
        puts "Box #{erb.uin} traveled to #{pc}!"
      elsif tn_exists
        puts "Tracking number already exists, skipping"
      else
        puts "No box data, skipping"
      end
    end
    ct
  end

private

  def increment_box_counter
    Box.increment_counter(:locations_count, unique_number.box_id)
  end

  def decrement_box_counter
    Box.decrement_counter(:locations_count, unique_number.box_id)
  end

  def update_latlng
    latLng = Geocoder.coordinates(self.postal_code)
    self.lat = latLng[0]
    self.lng = latLng[1]
  end

end
