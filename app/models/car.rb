class Car <ActiveRecord::Base
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true
end