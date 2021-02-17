class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
    @playlists = Playlist.find_by(params[:genre_id])
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
     redirect_to playlist_path(@playlist.id), notice: "You have created playlist successfully."
    else
     @playlists = Playlist.all
     render :index
    end
  end

  def index
    @playlist_ranking = Playlist.left_outer_joins(:favorites).group('playlists.id').select('playlists.id, playlists.user_id, playlists.name, playlists.information, COUNT(favorites.id) AS favorites_count').distinct.reorder(favorites_count: :desc)
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlists = Playlist.all
    @playlist_comment = PlaylistComment.new
    @playlist_comments = @playlist.playlist_comments
    @songs = @playlist.songs
  end

  def edit
    @playlist = Playlist.find(params[:id])
    # @playlist.songs.build
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
     redirect_to playlist_path, notice: "You have updated playlist successfully."
    else
     render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path
  end



  private

  def playlist_params
    params.require(:playlist).permit(:name, :information, :genre_id)
  end

  def correct_playlist
    @playlist = Playlist.find(params[:id])
    if @playlist.user!=current_user
        redirect_to playlists_path
    end
  end

end
