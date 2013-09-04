class PasswordsController < ApplicationController
	after_action :clear_expired_registrants
	before_action	:get_registrant

	def new
    # Create a new user with same email, then display form
    @user = User.new(email: @registrant.email)
  end

	 # POST /register/:code - create a new user
  def create
    # Create a new user from the registrant
    # Keep the email the same
    @user = User.new(user_params)
    @user.email = @registrant.email
    
    # If the user is valid and saves, then destroy the
    # registrant, log the user in, and redirect to the home page
    if @user.save
      @registrant.destroy
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Welcome to Track Yo' Gas!"
    else
      # Else, rerender the form
      render :new
    end
  end
  
  private
  
  def get_registrant
    @registrant = Registrant.find_by(code: params[:code])
    
    unless @registrant
      Registrant.where('expires_at < ?', Time.now).destroy_all
			redirect_to login_url
			flash[:alert] = "Registration Link Expired"
    end
  end

	def clear_expired_registrants
		Registrant.where('expires_at < ?', Time.now).destroy_all
	end

	def user_params
		params.require(:user).permit(
			:first_name,
			:last_name,
			:email,
			:password,
			:password_confirmation
			)
	end
end