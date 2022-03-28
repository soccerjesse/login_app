class ApplicationController < ActionController::Base
  helper_method :current_user

  def already_login
    unless current_user.nil?
      redirect_to user_path, notice: "you are already logged in!"
    end   
  end

  def login_no
    if current_user.nil?
      redirect_to login_path, alert: "you have to log in!"
    end
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
end
