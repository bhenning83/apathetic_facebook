module UsersHelper
  def friends?(user)
    current_user.friends.all.include? (user)
  end
end
