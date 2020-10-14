module FriendRequestsHelper
  def request_sent?(user)
    request = FriendRequest.where('requestee_id: user.id AND
                                  requester_id: current_user.id')
    request
  end
end
