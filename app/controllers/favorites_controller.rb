class FavoritesController < ApplicationController

  def create
    @playlist = Playlist.find(params[:playlist_id])
    favorite = current_user.favorites.new(playlist_id: @playlist.id)
    favorite.save

  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    favorite = current_user.favorites.find_by(playlist_id: @playlist.id)
    favorite.destroy

  end

end
