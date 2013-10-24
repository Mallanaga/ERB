# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  ordered_on   :date
#  delivered_on :date
#  paid         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  invoice      :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :company_id, :ordered_on, :delivered_on, :paid, :invoice

  has_many :order_details

  def cost
    self.order_details.map{ |d| d.quantity * d.box_price + d.mould_fees }.sum
  end

end
