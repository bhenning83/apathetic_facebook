module FriendRequestsHelper
  def request_sent?(user)
    requestee?(user) || requester?(user)
  end

  def requester?(user)
    request = FriendRequest.where('requestee_id = ? AND
                                   requester_id = ?',
                                   user.id, 
                                   current_user.id)[0]
    request
  end

  def requestee?(user)
     request = FriendRequest.where('requestee_id = ? AND
                                   requester_id = ?',
                                   current_user.id, 
                                   user.id)[0]
    request
  end

  def friend_request_list
    requests = FriendRequest.includes(:requester).where(requestee_id: current_user.id).limit(5)
    requests
  end
end
