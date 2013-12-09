class AddDefaultsToOrders < ActiveRecord::Migration
  def change
    change_column :order_details, :quantity, :integer, default: 0
    change_column :order_details, :mould_fees, :decimal, default: 0.00
    change_column :order_details, :box_price, :decimal, default: 0.00
    change_column :order_details, :cb_price, :decimal, default: 0.00
  end
end
