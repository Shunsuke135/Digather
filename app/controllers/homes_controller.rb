class HomesController < ApplicationController
 before_action :authenticate_user!, except: [:top, :about, :new_guest]

  def top
  end

  def about
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to user_path(current_user), notice: 'Signed in successfully.'  #サインイン後はuser/show画面に遷移
  end

end
