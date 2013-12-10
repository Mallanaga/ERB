class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.text :message
      t.string :type_box
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.integer :quantity
      t.timestamps
    end
  end
end
