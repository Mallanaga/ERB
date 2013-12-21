# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  message    :text
#  type_box   :string(255)
#  length     :decimal(, )
#  width      :decimal(, )
#  height     :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quote < ActiveRecord::Base
  attr_accessible :name, :company, :email, :phone, :message,
                  :type_box, :length, :width, :height, :quantity

  validates :name, :phone, :company, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }
end
