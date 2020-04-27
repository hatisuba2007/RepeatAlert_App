class SessionsController < ApplicationController
  def new
  end

  def create
    salon = Salon.find_by(email: params[:session][:email].downcase)
    if salon && salon.authenticate(params[:session][:password])
      log_in salon
      params[:session][:remember_me] == '1' ? remember(salon) : forget(salon)
       redirect_to "/"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/'
    end
  end

  def destroy
    log_out
    redirect_to "/"    
  end
end