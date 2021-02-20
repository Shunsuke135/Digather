class Genre < ApplicationRecord

  has_many :playlists, dependent: :destroy

  validates :comment, presence: true

end
