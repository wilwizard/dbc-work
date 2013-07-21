class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    if current_user.nil?
      redirect_to new_session_path
      flash[:errors] = "you must sign up before you do that"
    end
  end
end
