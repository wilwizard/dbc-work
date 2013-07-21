class User < ActiveRecord::Base

  before_create :encrypt_password

  has_many :posts
  has_many :comments

  def self.authenticate(args)
    user = self.find_by_name(args[:name])
    if user
      temp_encryption = Digest::SHA1.hexdigest("#{args[:password]}")
      user.password == temp_encryption ? user : nil
    else
      false
    end
  end

  def encrypt_password
    encrypted_password = Digest::SHA1.hexdigest("#{password}")
    self.password = encrypted_password
    password = nil
  end

end
