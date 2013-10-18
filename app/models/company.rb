# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  postal_code :string(255)
#  website     :string(255)
#  about       :text
#  testimonial :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :name, :website, :acquired, :about, :testimonial

  has_many :boxes
  has_many :users
  has_many :orders

  validates :name, presence: true
  validates :about, presence: true

  def acquired
    Order.order('ordered_on asc').find_all_by_company_id(self.id).first.ordered_on.to_date
  end

  def trees
    self.boxes.map { |b| b.trees }.sum
  end

  def water
    self.boxes.map { |b| b.water }.sum
  end

  def electricity
    self.boxes.map { |b| b.electricity }.sum
  end

end
