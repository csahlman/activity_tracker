class AccountConfirmationsController < ApplicationController

  def create
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if @user.present?
      sign_in @user
      redirect_to root_path, success: "Account confirmed" 
    else
      redirect_to root_path, error: "Invalid confirmation token" 
    end
  end

end