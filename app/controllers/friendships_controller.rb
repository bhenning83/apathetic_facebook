class FriendshipsController < ApplicationController
  def create
    friend_request = FriendRequest.find_by(id: params[:friend_request])
    friend_request.accept
    redirect_to request.referrer
  end

  def destroy
    friend_request = FriendRequest.find_by(id: params[:friend_request])
    friend_request.decline
    redirect_to request.referrer
  end

end
