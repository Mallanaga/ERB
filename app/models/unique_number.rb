class UniqueNumber < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uin

  attr_accessible :uin, :active, :box_id

  belongs_to :box
  has_many :locations

  validates :uin, presence: true, 
                  uniqueness: { case_sensitive: false }

end
