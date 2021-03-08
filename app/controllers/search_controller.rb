class SearchController < ApplicationController

  def search

    @playlist = Playlist.new
    @playlist_ranking = Playlist.left_outer_joins(:favorites).
                                group(:id).select('playlists.*, COUNT(favorites.id) AS favorites_count').
                                order(favorites_count: :desc).page(params[:page])


    if params[:genre] == "user"
      # if params[:direction] == "keyword"    #部分一致だけなので選択欄不要
         @users = User.where('name LIKE ?', "%#{params[:q]}%").page(params[:page]).reverse_order
      # end

    # elsif params[:genre] == "genre"
    #     @playlists = Genre.where('name LIKE ?', "%#{params[:q]}%").page(params[:page]).reverse_order

    elsif params[:genre] == "playlist"
      # if  params[:direction] == "keyword"
         @playlist_ranking = Playlist.where('name LIKE ?', "%#{params[:q]}%").left_outer_joins(:favorites).
                              group(:id).select('playlists.*, COUNT(favorites.id) AS favorites_count').
                              order(favorites_count: :desc).page(params[:page])
    end
      # end

  end

end
