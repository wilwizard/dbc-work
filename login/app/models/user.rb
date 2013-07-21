class User < ActiveRecord::Base

  attr_accessible :name, :email, :password

  has_secure_password
  validates :password_confirmation, presence: true

end