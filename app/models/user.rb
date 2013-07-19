class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)

    if user && user.password == password
      return user
    else
      false
    end

  end
end
