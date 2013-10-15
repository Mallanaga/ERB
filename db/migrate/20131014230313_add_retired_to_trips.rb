class AddRetiredToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :retired, :integer
  end
end
