class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def list
    @users = User.all
  end

  private
    
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
