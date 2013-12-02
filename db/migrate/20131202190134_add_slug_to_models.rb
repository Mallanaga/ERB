class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :companies, :slug, :string
    add_column :posts, :slug, :string
    add_index :companies, :slug
    add_index :posts, :slug
  end
end
