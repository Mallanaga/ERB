class AddMoreDefaults < ActiveRecord::Migration
  def change
    change_column :orders, :ordered_on, :date, default: Date.today
    change_column :orders, :delivered_on, :date, default: Date.today+7
  end
end
