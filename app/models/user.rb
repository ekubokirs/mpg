class User < ActiveRecord::Base
	has_many :cars
	before_validation :encrypt_password
	
	attr_accessor :password, :password_confirmation

  def full_name
    first_name + " " + last_name
  end

  def authenticate(password)
  	self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def encrypt_password
  	unless password.blank?
  		self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end