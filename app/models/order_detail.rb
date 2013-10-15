# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  box_id     :integer
#  quantity   :integer
#  box_price  :decimal(8, 2)
#  cb_price   :decimal(8, 2)
#  mould_fees :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ActiveRecord::Base
  attr_accessible :box_id, :quantity, :box_price, :cb_price, :mould_fees

  belongs_to :order
end
