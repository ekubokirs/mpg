class PasswordsController < ApplicationController
	after_action :clear_expired_registrants
	before_action	:get_registrant

	def new
		@user = User.new(email: @registrant.email)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url
			flash[:notice] = "User Created!"
		else
			flash[:notice] = "Error"
			render :new
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		redirect_to root_url
		flash[:notice] = "User Details Updated!"
	end

	private
	def user_params
		params.require(:user).permit(
			:first_name,
			:last_name,
			:email,
			:zipcode,
			:email,
			:password,
			:password_confirmation
			)
	end
	def clear_expired_registrants
		Registrant.where('expires_at < ?', Time.now).destroy_all
	end

	def get_registrant
		@registrant = Registrant.find_by_code params[:code]
		unless @registrant
			Registrant.where('expires_at < ?', Time.now).destroy_all
			redirect_to login_url
			flash[:alert] = "Registration Link Expired"
		end
	end
end