class FixUpBoxes < ActiveRecord::Migration
  def change
    remove_column :boxes, :trips
    remove_column :companies, :acquired
    remove_column :boxes, :in
    remove_column :boxes, :out
  end
end
