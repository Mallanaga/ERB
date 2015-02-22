class AddRetireToBox < ActiveRecord::Migration
  def change
    add_column :box, :retire, :integer, default: 5
  end
end
