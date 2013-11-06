class AddMultiplierBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :multiplier, :integer, default: 1
  end
end
