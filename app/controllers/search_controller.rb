class SearchController < ApplicationController

  def search
    @playlist = Playlist.new

    if params[:genre] == "user"
      # if params[:direction] == "keyword"
         @users = User.where('name LIKE ?', "%#{params[:q]}%")
      # end

    elsif params[:genre] == "playlist"
      # if  params[:direction] == "keyword"
          @playlists = Playlist.where('name LIKE ?', "%#{params[:q]}%")
    end
    # end
  end

end
