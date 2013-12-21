class CreateUniqueNumbers < ActiveRecord::Migration
  def change
    create_table :unique_numbers do |t|
      t.belongs_to :box
      t.string :uin
      t.boolean :active
      t.integer :locations_count, default: 0
      t.timestamps
    end

    add_index :unique_numbers, :uin, unique: :true
  end
end
