module BlogsHelper

    def correct_user
      @blog = current_user.blogs.find_by(id: params[:id])
      redirect_to root_url if @blog.nil?       # user is not correct for this blog
    end

    def by_me?(blog)
      if logged_in?
        !current_user.blogs.find_by(id: blog.id).nil?
      else
        false
      end
    end

end
