# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  box_id     :integer
#  quantity   :integer          default(0)
#  box_price  :decimal(8, 2)    default(0.0)
#  cb_price   :decimal(8, 2)    default(0.01)
#  mould_fees :decimal(8, 2)    default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ActiveRecord::Base
  attr_accessible :box_id, :quantity, :box_price, :cb_price, :mould_fees

  belongs_to :order
  belongs_to :box

  validates :box_id, presence: true
end
