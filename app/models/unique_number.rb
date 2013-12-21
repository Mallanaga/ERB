class UniqueNumber < ActiveRecord::Base
  attr_accessible :uin, :active, :box_id

  belongs_to :box
  has_many :locations

end
