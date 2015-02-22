class AddRetireToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :retire, :integer, default: 5
  end
end
