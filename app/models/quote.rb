class Quote < ActiveRecord::Base
  attr_accessible :name, :company, :email, :phone, :message,
                  :type_box, :length, :width, :height, :quantity

  validates :name, :phone, :company,
            :length, :width, :height, :quantity, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }
end
