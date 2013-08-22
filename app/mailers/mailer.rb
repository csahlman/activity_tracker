class Mailer < ActionMailer::Base
  default from: "from@example.com"

  def user_confirmation_email(user_id)
    @user = User.find(user_id)
    mail to: @user.email, subject: "Confirm your account" 
  end

  def send_password_reset(user_id)
    @user = User.find(user_id)
    mail to: @user.email, subject: "Your password has been reset" 
  end
end
