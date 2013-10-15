class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :company
      t.date :ordered_on
      t.date :delivered_on
      t.boolean :paid

      t.timestamps
    end
  end
end
