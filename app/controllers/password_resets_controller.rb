class PasswordResetsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? && @user.valid_for_password_reset?
      @user.create_password_reset
      Mailer.send_password_reset(@user.id).deliver
    end
    redirect_to root_path, success: "Password reset, please check your email"
  end

  def edit
    
  end

  def update
    password_hash = { password: params[:password], password_confirmation: 
      params[:password_confirmation]}
    params.permit(:password, :password_confirmation)
    @user = User.find_by_password_reset_token(params[:token]) if params[:token].present?
    if @user.present? 
      if @user.update_attributes(password_hash)
        sign_in @user
        redirect_to root_path, success: "Password Updated"
      else
        render :edit
      end
    else
      redirect_to root_path, error: "Invalid Token"
    end
  end

end