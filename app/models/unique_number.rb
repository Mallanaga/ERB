class UniqueNumber < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uin

  attr_accessible :uin, :active, :box_id

  belongs_to :box
  has_many :locations

end
