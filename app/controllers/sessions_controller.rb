class SessionsController < ApplicationController

  # @user = User.find_by_email(params[:session][:email])
  #     if @user && @user.authenticate(params[:session][:password])

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.confirmed? 
        sign_in @user
        redirect_to root_path, success: "Successfully signed in"
      else
        flash.now[:error] = "Account not confirmed, please click 
          below to resend instructions"
        render :new
      end
    else
      flash.now[:error] = "There was an error logging in" 
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, success: "Signed Out" 
  end
end