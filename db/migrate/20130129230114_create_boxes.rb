class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.belongs_to :company
      t.string :uid
      t.integer :in
      t.integer :out
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :weight
      t.integer :trips, default: 0
      t.decimal :cost, precision: 6, scale: 2
      t.decimal :cb_cost, precision: 6, scale: 2

      t.timestamps
    end

    add_index :boxes, :uid, unique: :true
    add_index :boxes, :company_id
  end
end
