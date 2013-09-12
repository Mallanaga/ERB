class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :post
      t.belongs_to :category
      
      t.timestamps
    end
  end
end
