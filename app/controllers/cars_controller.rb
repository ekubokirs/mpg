class CarsController < ApplicationController
	before_action :is_authenticated
	def index
		@cars = current_user.cars
	end

	def stats
		@cars = current_user.cars
		@mpg = Array.new
		@cars.find(params[:id]).tanks.each do |tank|
			@mpg << {mpg: tank.mpg, date: tank.created_at}
		end
		respond_to do |format|
			format.json{render :json => @mpg, :status => :ok}
		end
	end

	def new
		@car = Car.new
	end

	def create
		@car = Car.new(car_params)
		@car.user = current_user
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
		@tanks = @car.tanks.all
		puts "*"*50
		puts @tanks
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
		redirect_to cars_path
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