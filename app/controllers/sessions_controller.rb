class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'Successfully logged in'
      redirect_to user
    else
      render 'new'
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def destroy
    log_out
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
