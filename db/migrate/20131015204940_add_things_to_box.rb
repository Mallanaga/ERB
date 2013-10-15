class AddThingsToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :frequency, :integer
    add_column :boxes, :active, :boolean
    change_column :trips, :retired, :integer, default: 0
  end
end
