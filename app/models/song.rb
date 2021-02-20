class Song < ApplicationRecord

  belongs_to :playlist

  validates :artist, presence: true, length: {maximum: 20}
  validates :tune, presence: true, length: {maximum: 30}
  validates :detail, presence: true, length: {maximum: 70}

end
