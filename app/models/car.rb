class Car < ActiveRecord::Base
	has_many :tanks
	belongs_to :user

	def name
		make+" "+brand
	end
end
