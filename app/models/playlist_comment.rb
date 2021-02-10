class PlaylistComment < ApplicationRecord

  belongs_to :user
  belongs_to :playlist

  validates :comment, presence: true

end
