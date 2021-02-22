class SearchController < ApplicationController

  def search
    @playlist_ranking = Playlist.left_outer_joins(:favorites).group('playlists.id').select('playlists.id, playlists.user_id, playlists.name, playlists.information, COUNT(favorites.id) AS favorites_count').distinct.reorder(favorites_count: :desc)
    @playlist = Playlist.new

    if params[:genre] == "user"
      # if params[:direction] == "keyword"    #部分一致だけなので選択欄不要
         @users = User.where('name LIKE ?', "%#{params[:q]}%")
      # end

    elsif params[:genre] == "playlist"
      # if  params[:direction] == "keyword"
          @playlists = Playlist.where('name LIKE ?', "%#{params[:q]}%")
    end
      # end
  end

end
