# == Schema Information
#
# Table name: boxes
#
#  id         :integer          not null, primary key
#  company_id :integer
#  uid        :string(255)
#  length     :decimal(, )
#  width      :decimal(, )
#  height     :decimal(, )
#  volume     :decimal(, )
#  weight     :decimal(, )
#  trips      :integer          default(0)
#  distance   :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Box < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uid
  
  attr_accessible :company_id, :uid, :in, :out, :length, :width, :height,
                  :weight, :trips, :cost, :cb_cost, :created_at
                  
  belongs_to :company

  before_save :t

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |box|
        csv << box.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    #number of boxes updated
    ct = 0

    CSV.foreach(file.path, headers: true) do |row|
      if row['uid']
        box = find_by_id(row["id"]) || new
        box.attributes = row.to_hash.slice(*accessible_attributes)
        box.save!
        puts "#{box.uid} updated"
        ct += 1
      else
        puts "Box not modified, skipping"
      end
    end
    ct
  end

  def date
    self.created_at.to_date
  end

  def trees
    w = self.trips * self.weight
    (w * 0.00133).round(1)
  end

  def water
    w = self.trips * self.weight
    (w * 5.3).round
  end
 
  def electricity
    w = self.trips * self.weight
    (w * 8.687).round(1)
  end

  private
    #make sure trips has a value
    def t
      self.trips = 0 if trips.nil?
    end

end
