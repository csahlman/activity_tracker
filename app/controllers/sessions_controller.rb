class SessionsController < ApplicationController

  # @user = User.find_by_email(params[:session][:email])
  #     if @user && @user.authenticate(params[:session][:password])

  def destroy
    sign_out
    redirect_to root_path, success: "Signed Out" 
  end
end