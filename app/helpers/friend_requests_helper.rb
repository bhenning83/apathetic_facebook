module FriendRequestsHelper
  def request_sent?(user)
    request = FriendRequest.where('requestee_id: user.id AND
                                  requester_id: current_user.id')
    request
  end

  def friend_request_list
    requests = FriendRequest.includes(:requester).where(requestee_id: current_user.id).limit(5)
    requests
  end
end
