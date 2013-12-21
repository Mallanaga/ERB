# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  feed_id      :integer
#  user_id      :integer
#  title        :string(255)
#  author       :string(255)
#  url          :string(255)
#  summary      :text
#  content      :text
#  guid         :string(255)
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string(255)
#

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
