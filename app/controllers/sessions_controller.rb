class SessionsController <ApplicationController
	# add authentication
	def index
	end

	def new
	end

	def create
		@user = User.find_by_email params[:email]
	  if params[:email].blank?
	    flash[:alert] = "Please Enter E-mail"
	    render :new
	  else
	    if @user
	      if params[:password].blank?
	        @user.code = SecureRandom.urlsafe_base64
	        @user.expires_at = Time.now + 4.hours
	        @user.save

	        PasswordMailer.reset_email(@user).deliver
	        redirect_to login_url
	        flash[:alert] = "Password Reset E-mail Sent!"
	      else
	        if @user.authenticate(params[:password])
	          session[:user_id] = @user._id
	          redirect_to root_url
	        else
	          redirect_to login_url
	          flash[:alert] = "Wrong E-mail or Password.  Please Try Again!"
	        end
	      end
	    else
	      @registrant = Registrant.new(email: params[:email])
	      @registrant.save

	      PasswordMailer.registration_email(@registrant).deliver

	      redirect_to login_url
	      flash[:alert] = "A Registration E-mail Has Been Sent!"
	  	end
	  end
	end

	def destroy
		session[:user_id] = nil
    redirect_to login_url
    flash[:alert] = "You've Logged Out!"
	end
end