class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :box
      t.date :month
      t.integer :quantity
      
      t.timestamps
    end
  end
end
