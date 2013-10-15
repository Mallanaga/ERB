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

require 'spec_helper'

describe Feed do
  pending "add some examples to (or delete) #{__FILE__}"
end
