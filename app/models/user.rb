class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :admin
  has_secure_password

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  before_create :create_token


  private

  	def create_token
  		self.token = SecureRandom.urlsafe_base64
  	end

end
