class Car < ActiveRecord::Base
	has_many :tanks

	def name
		make+" "+brand
	end
end
