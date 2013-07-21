class User < ActiveRecord::Base
  include BCrypt

  def password=(new_password)
    self.password_hash = Password.create(new_password)
    self.save
  end

  def auth_password(password_attempt)
    Password.new(self.password_hash)==password_attempt
  end

  def self.create(args)
    user = User.new(name: args[:name], email: args[:email])
    user.password=args[:password]
    user.save
    user
  end
end
