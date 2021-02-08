class UsersController < ApplicationController

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


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end








  def withdrawal
    @user = current_user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end



end
