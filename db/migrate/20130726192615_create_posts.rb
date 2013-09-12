class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :feed
      t.belongs_to :user
      t.string :title
      t.string :author
      t.string :url
      t.text :summary
      t.text :content
      t.string :guid
      t.datetime :published_at
    
      t.timestamps
    end
    add_index :posts, :published_at
  end
end