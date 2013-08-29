class TanksController < ApplicationController
	
	def index
		@tanks = Tank.all
	end

	def new
		@tanks  = Tank.new
	end

	def create
		@tank = Tank.new(tank_params)
		if @tank.save
			redirect_to tanks_url
			flash[:notice] = "Tank Created!"
		else
			flash[:notice] = "Error"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def tank_params
		params.require(:tank).permit(
			:amount,
			:price,
			:current_miles
			)
	end
end