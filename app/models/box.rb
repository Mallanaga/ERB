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
#  weight     :decimal(, )
#  cost       :decimal(6, 2)
#  cb_cost    :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  frequency  :integer
#  active     :boolean
#

class Box < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uid
  
  attr_accessible :company_id, :uid, :length, :width, :height,
                  :weight, :cost, :cb_cost, :created_at, :frequency, :active
                  
  belongs_to :company
  has_many :trips

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

  def in
    OrderDetail.find_all_by_box_id(self.id).map{ |d| d.quantity }.sum
  end

  def out
    self.trips.map{ |t| t.retired }.sum    
  end

  def trip_count
    self.trips.map{ |t| t.quantity }.sum
  end

  def cost
    OrderDetail.find_all_by_box_id(self.id).map{ |d| d.box_price }.sum
  end

  def cb_cost
    OrderDetail.find_all_by_box_id(self.id).map{ |d| d.cb_price }.sum
  end

  def date
    self.created_at.to_date
  end

  def trees
    w = self.trips.map{ |t| t.quantity }.sum * self.weight
    (w * 0.00133).round(1)
  end

  def water
    w = self.trips.map{ |t| t.quantity }.sum * self.weight
    (w * 5.3).round
  end
 
  def electricity
    w = self.trips.map{ |t| t.quantity }.sum * self.weight
    (w * 8.687).round(1)
  end

  def self.update_trips
    Box.where(active: true).each do |box| 
      box.trips.build(month: (Date.today+3.days).strftime('%Y-%m-01'), quantity: box.frequency, retired: 10).save
    end
  end

  private
  
end
