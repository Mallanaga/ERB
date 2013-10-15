# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :category
  belongs_to :post
  
end
