class Feed < ActiveRecord::Base
  attr_accessible :url, :feed_url, :title, :etag, :last_modified, :newest_entry_url

  has_many :posts
end
