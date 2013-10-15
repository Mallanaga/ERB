# == Schema Information
#
# Table name: feeds
#
#  id               :integer          not null, primary key
#  url              :string(255)
#  feed_url         :string(255)
#  title            :string(255)
#  etag             :string(255)
#  last_modified    :string(255)
#  newest_entry_url :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Feed < ActiveRecord::Base
  attr_accessible :url, :feed_url, :title, :etag, :last_modified, :newest_entry_url

  has_many :posts
end
