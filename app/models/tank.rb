class Tank < ActiveRecord::Base
	belongs_to :car

	def mpg
		(current_miles.to_f/amount.to_f).round(2)
	end

	def ppm
		(price.to_f/current_miles.to_f).round(2)
	end
end
