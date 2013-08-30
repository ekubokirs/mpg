class CarsController < ApplicationController
	def index
		@cars = Car.all
	end

	def new
		@car = Car.new
	end

	def create
		@car = Car.new(car_params)
		if @car.save
			redirect_to cars_url
			flash[:notice] = "Car Created!"
		else
			flash[:notice] = "Error"
			render :new
		end
	end

	def show
		@car = Car.find(params[:id])
	end

	def edit
		@car = Car.find(params[:id])
	end

	def update
		@car = Car.find(params[:id])
		@car.update_attributes(car_params)
		redirect_to root_url
		flash[:notice] = "Car Details Updated"
	end

	def destroy
		car = Car.find(params[:id])
		car.destroy
		redirect_to car_path
		flash[:notice] = "Car Deleted"
	end

	private
	def car_params
		params.require(:car).permit(
			:make,
			:brand,
			:year,
			:color,
			:current_miles
		)
	end
end