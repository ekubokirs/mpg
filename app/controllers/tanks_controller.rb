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
		@tank = Tank.find(params[:id])
	end

	def edit
		@tank = Tank.find(params[:id])
	end

	def update
		@tank = Tank.find(params[:id])
		@car.update_attributes(tank_params)
		redirect_to root_url
		flash[:notice] = "Tank Details Updated"
	end

	def destroy
		tank = Tank.find(params[:id])
		tank.destroy
		redirect_to tank_path
		flash[:notice] = "Tank Deleted"
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