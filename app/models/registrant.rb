class Registrant < ActiveRecord::Base
	before_create :set_code_and_expires_at
	
	private
	
	def set_code_and_expires_at
		self.code = SecureRandom.urlsafe_base64
		self.expires_at = Time.now + 4.hours
  end
end
