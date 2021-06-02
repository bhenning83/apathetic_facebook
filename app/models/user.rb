class User < ApplicationRecord
  require 'open-uri'
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :name, presence: true, uniqueness: true
  validates :email, :encrypted_password, presence: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy

  has_many :received_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requestee_id,
            dependent: :destroy

  has_many :sent_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requester_id,
            dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      if user.avatar.attached?
      else
        # open the link
        downloaded_image = open(auth.info.image)

        # upload via ActiveStorage
        # be careful here! the type may be png or other type!
        user.avatar.attach(io: downloaded_image, filename: 'image.jpg', content_type: downloaded_image.content_type)
      end
    end
  end
end
