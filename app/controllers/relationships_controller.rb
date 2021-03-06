class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    current_user.follow(@user)
    # redirect_back fallback_location: root_url #非同期通信実装の為にコメントアウト
  end

  def destroy
    current_user.unfollow(@user)
    # redirect_back fallback_location: root_url #非同期通信実装の為にコメントアウト
  end

  def followings
    @users = @user.followings.page(params[:page]).reverse_order
    render 'users/index'
  end

  def followers
    @users = @user.followers.page(params[:page]).reverse_order
    render 'users/index'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
