module UsersHelper

  def at_home?(user)
    current_user.id.eql? user.id
  end

end
