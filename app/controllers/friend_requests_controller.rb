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
  end
end
