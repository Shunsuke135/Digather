class SearchController < ApplicationController

  def search

    # @users = User.page(params[:page]).reverse_order

    @playlist_ranking = Playlist.left_outer_joins(:favorites).
                          group(:id).select('playlists.*, COUNT(1) AS favorites_count').
                          order(favorites_count: :desc).page(params[:page])
    @playlist = Playlist.new

    if params[:genre] == "user"
      # if params[:direction] == "keyword"    #部分一致だけなので選択欄不要
         @users = User.where('name LIKE ?', "%#{params[:q]}%").page(params[:page]).reverse_order
      # end

    elsif params[:genre] == "playlist"
      # if  params[:direction] == "keyword"
          @playlists = Playlist.where('name LIKE ?', "%#{params[:q]}%")
    end
      # end
  end

end
