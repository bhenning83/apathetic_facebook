class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  before_destroy :delete_friends
  
  def delete_friends
    user.friends.destroy(friend)
    friend.friends.destroy(user)
  end

end
