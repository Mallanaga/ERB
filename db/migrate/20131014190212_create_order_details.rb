class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.belongs_to :order
      t.integer :box_id
      t.integer :quantity
      t.decimal :box_price, precision: 8, scale: 2
      t.decimal :cb_price, precision: 8, scale: 2
      t.decimal :mould_fees, precision: 8, scale: 2
      
      t.timestamps
    end
  end
end
