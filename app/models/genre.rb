class Genre < ApplicationRecord

  has_many :playlists, dependent: :destroy

  validates :name, presence: true

end
