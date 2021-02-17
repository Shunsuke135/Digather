class Genre < ApplicationRecord
  
  has_many :playlists, dependent: :destroy
  
end
