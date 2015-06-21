class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    else
      render 'new'
    end
  end

  def create
    user = User.find_by(email: session_params[:email].downcase, password: session_params[:password])
    if user
      log_in user
      redirect_to user
    else
      # error
      flash[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
