class Playlist < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :playlist_comments, dependent: :destroy


  validates :artist, presence: true
  validates :tune, presence: true
  validates :information, presence: true, length: {maximum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
