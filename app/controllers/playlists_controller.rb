class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
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
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
    # @booknew = Book.new
    @playlist_comment = PlaylistComment.new
    @playlist_comments = @playlist.playlist_comments
  end

  def edit
    @playlist = Playlist.find(params[:id])
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
    params.require(:playlist).permit(:artist, :tune, :information)
  end

  def correct_playlist
    @playlist = Playlist.find(params[:id])
    if @playlist.user!=current_user
        redirect_to playlists_path
    end
  end

end
