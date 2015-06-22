module UsersHelper

  def at_home?(user)
    if logged_in?
      current_user.id.eql? user.id
    else
      false
    end
  end

end
