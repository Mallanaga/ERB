class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :feed_url
      t.string :title
      t.string :etag
      t.string :last_modified
      t.string :newest_entry_url
      
      t.timestamps
    end
  end
end
