class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect to "users/:id"
      flash[:success] = "Welcome to Bloggoor"
      redirect_to @user
    else
      # Render the form again; 
      # Error will be displayed accordingly
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
