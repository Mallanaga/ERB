# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  postal_code :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :name, :website, :acquired, :about, :testimonial

  has_many :boxes
  has_many :users

  validates :name, presence: true
  validates :about, presence: true

  def total_weight
    self.boxes.map { |box| box.trips * box.weight }.sum  
  end

  def paper_cost
    w = self.total_weight
    # 0.95 is the avg U-line price per lb of cb.  Retailers usually pay 66-75% of that cost.
    w * 0.9565 * 0.75
  end

  def trees
    b = self.total_weight
    (b * 0.00133).round(1)
  end

  def water
    b = self.total_weight
    (b * 5.3).round
  end

  def electricity
    b = self.total_weight
    (b * 8.687).round
  end

end
