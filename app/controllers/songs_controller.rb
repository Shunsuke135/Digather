class SongsController < ApplicationController

  def new
    @song = Song.new
    @playlist = Playlist.find(params[:playlist_id])   
  end


  def create
    @song = Song.new(song_params)
    @song.playlist_id = params[:playlist_id]
    if @song.save
     redirect_to playlist_path(@song.playlist_id), notice: "You have created add tune successfully."
    else
     @playlist = Playlist.find(params[:playlist_id])
     render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to playlist_path(@song.playlist_id)
  end

  private

  def song_params
    params.require(:song).permit(:artist, :tune, :detail)
  end

end
