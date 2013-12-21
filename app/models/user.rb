# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  company_id             :integer
#  name                   :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  subscribe              :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :company_id, :admin, :subscribe,
                  :password, :password_confirmation
  has_secure_password

  belongs_to :company
  has_many :posts

  before_save { |user| user.email = email.downcase.strip }
  before_save :create_remember_token
  after_save :add_mailings

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def first_name
    self.name.split(' ').first
  end

private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def add_mailings
      if self.subscribe?
        Mailing.create(email: self.email, name: self.name)
      else
        Mailing.where(email: self.email)[0].delete
      end
    end
end
