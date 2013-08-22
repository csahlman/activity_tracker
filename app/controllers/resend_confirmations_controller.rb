class ResendConfirmationsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? && !@user.confirmed?
      Mailer.user_confirmation_email(@user.id).deliver
    end
    redirect_to root_path, success: "Account confirmation email sent"
  end

end