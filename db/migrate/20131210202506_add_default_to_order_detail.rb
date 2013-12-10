class AddDefaultToOrderDetail < ActiveRecord::Migration
  def change
    change_column :order_details, :cb_price, :decimal, default: 0.01
  end
end
