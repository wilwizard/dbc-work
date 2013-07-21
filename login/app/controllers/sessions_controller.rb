class SessionsController < ActionController::Base
  
  def create
    p '******************'
    p params

    user = User.find_by_email(params[:session][:email])
    if user.authenticate(params[:session][:password])
      sign
    end

  end

  def new
  end

  def destroy
  end

end
