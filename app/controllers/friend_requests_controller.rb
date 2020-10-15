class FriendRequestsController < ApplicationController
  def create
    request = current_user.sent_friend_requests.build(
                                                requestee_id: params[:user_id]
                                                )
    if request.save
      flash.notice = 'Friend Request sent'
      redirect_to user_path(params[:user_id])
    end
  end

  def destroy
    friend_request = FriendRequest.find_by(id: params[:friend_request])
    friend_request.decline
    redirect_to request.referrer
  end
end
