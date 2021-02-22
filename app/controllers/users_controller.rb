class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists
    @playlist = Playlist.new
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @playlist = Playlist.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user)
    end
  end

end
