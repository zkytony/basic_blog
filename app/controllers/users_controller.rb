class UsersController < ApplicationController
  before_action :logged_in_user, only: :destroy

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
      log_in @user
      redirect_to @user
    else
      # Render the form again; 
      # Error will be displayed accordingly
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def list
    @users = User.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'update'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      log_out
    end
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  private
    
    # strong parameter
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :birthday)
    end
end
