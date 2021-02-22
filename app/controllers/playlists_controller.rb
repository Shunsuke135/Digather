class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_playlist, only: [:edit, :update, :destroy]

  def new
    @playlist = Playlist.new
    @playlists = Playlist.find_by(params[:genre_id])    #db/seeds.rbでジャンル作成済み
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
     redirect_to playlist_path(@playlist.id), notice: "You have created playlist successfully."
    else
     @playlist_ranking = Playlist.left_outer_joins(:favorites).group('playlists.id').select('playlists.id, playlists.user_id, playlists.name, playlists.information, COUNT(favorites.id) AS favorites_count').distinct.reorder(favorites_count: :desc)
     @playlists = Playlist.all
     render :new
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
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
     redirect_to playlist_path(@playlist.id), notice: "You have updated playlist successfully."
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
