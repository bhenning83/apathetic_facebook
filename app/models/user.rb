class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, foreign_key: :friend_id, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts

  has_many :received_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requestee_id

  has_many :sent_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requester_id

end
