class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  has_secure_password

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }

  before_create :create_token

  has_many :comments

  private

  	def create_token
  		self.token = SecureRandom.urlsafe_base64
  	end

end
