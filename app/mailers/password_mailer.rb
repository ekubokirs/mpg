class PasswordMailer < ActionMailer::Base
  default from: "no-reply@trackyogas.com"

  # Create new user email and pass it
  def registration_email(registrant)
    @registrant = registrant
    
    mail to: @registrant.email, subject: "Create your Track Yo' Gas credentials"
  end
  
  # Create the password reset email and pass it
  def reset_email(user)
    @user = user
    
    mail to: @user.email, subject: "Change your Track Yo' Gas credentials"
  end
  
end
