class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @all_users = User.all
    @c_user_friends = current_user.friends.all
    
  end
end
