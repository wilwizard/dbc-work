require 'spec_helper'
  def log_in_user(user)
    session[:user_id] = user.id
  end
