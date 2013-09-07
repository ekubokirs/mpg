class PasswordsController < ApplicationController
  after_action :clear_expired_registrants, only: [:new, :create]
  before_action :get_registrant, only: [:new, :create]
  # before_action :get_user, only: [:edit, :update]
  # after_action  :clear_expired_codes, only: [:edit, :update]
	
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

  def edit
    @user = User.find_by(code: params[:code])
    puts "*"*50
    puts @user.id
    # display the reset password form
    unless @user and @user.expires_at > Time.now
      redirect_to login_url, alert: "Reset link has expired. Please try again."
    end
  end

  def update
    # Find the user with the unique reset code
    @user = User.find_by(code: params[:user][:code])
    
    # If the user exists and the code has not expired
    if @user
      # do the password update and set the code
      @user.update_attributes(reset_params)
      @user.code = nil
      # expiry to null (expire the reset page)
      @user.expires_at = nil
      
      if @user.save
        # Password update was successful, log the user in and
        session[:user_id] = @user.id
        # redirect to the home page
        redirect_to root_url, notice: "Password changed successfully."
      
      else
        # Password update failed, redirect to the login page
        redirect_to login_url, alert: "Password Update Failed. Please try again."
      end
    else
      # User not found or code expired, redirect to the login page
      redirect_to login_url, alert: "User not found. Please try again."
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

  # def get_user
  #   @user = User.find_by(code: params[:code])
  #   unless @user and @user.expires_at < Time.now
  #     redirect_to login_url
  #     flash[:alert] = "Reset link has expired.  Please try again."
  #   end
  # end

  # def clear_expired_codes
  #   User.where('expires_at < ?', Time.now).update(code: nil, expires_at: nil)
  # end

  def reset_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :code,
      :expires_at)
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