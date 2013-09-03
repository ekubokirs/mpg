class Tank < ActiveRecord::Base
	belongs_to :car

	def mpg
		current_miles.to_f/amount.to_f
	end
end
