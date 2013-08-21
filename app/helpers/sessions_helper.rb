module SessionsHelper

  def sign_in(user)
    session[:user]= user.id
    # cookies.permanent[:vahrt]= user.remember_token
    self.current_user = user
  end

  def current_user
    # @current_user ||= User.find_by_remember_token(cookies[:vahrt])
    @current_user ||= User.find_by_id(session[:user])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def current_user= (user)
    @current_user = user
  end

  def sign_out
    self.current_user = nil
    session[:user]= nil  
    # cookies.delete(:vahrt)
  end

end