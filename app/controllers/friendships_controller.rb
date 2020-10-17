class FriendshipsController < ApplicationController
  def create
    friend_request = FriendRequest.find_by(id: params[:friend_request])
    friend_request.accept
    redirect_to request.referrer
  end

  def destroy
    Friendship.where('user_id: current_user.id AND
                      friend_id: params[:friend_id]')
    Friendship.destroy(@friendship.id)
    redirect_to request.referrer
  end

end
