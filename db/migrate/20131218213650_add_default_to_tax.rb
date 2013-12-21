class AddDefaultToTax < ActiveRecord::Migration
  def change
    change_column :orders, :tax, :decimal, default: 0.0
  end
end
