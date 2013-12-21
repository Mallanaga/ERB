class AddCountToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :locations_count, :integer, default: 0
  end
end
