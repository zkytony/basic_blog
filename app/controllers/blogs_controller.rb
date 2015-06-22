class BlogsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destory
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created"
      redirect_to user_blog_path(current_user, @blog)
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Blog deleted"
    redirect_to user_path(current_user)
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :content)
    end

end
