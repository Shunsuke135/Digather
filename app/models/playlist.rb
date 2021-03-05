class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :playlist_comments, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence: true
  validates :information, presence: true, length: {maximum: 100}
  validates :genre_id, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
