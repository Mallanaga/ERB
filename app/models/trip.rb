# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  box_id     :integer
#  month      :date
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
  attr_accessible :box_id, :month, :quantity, :retired

  belongs_to :box
end
