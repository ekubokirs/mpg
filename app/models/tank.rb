class Tank <ActiveRecord::Base
	validates :milage, presence: true
	validates :gallons, presence: true
	validates :price, presence: true
end