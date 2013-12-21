class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :unique_number
      t.string :postal_code
      t.string :tracking_number
      t.float :lat
      t.float :lng
      t.timestamps
    end

    add_index :locations, :unique_number_id
    add_index :locations, [:lat, :lng]
  end
end
