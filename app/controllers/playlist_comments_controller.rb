class PlaylistCommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :comment_correct_user, only: [:destroy]

    def create
      @playlist = Playlist.find(params[:playlist_id])
      @comment = current_user.playlist_comments.new(comment_params)
      @comment.playlist_id = @playlist.id
      @comment.save
      @comment_count = @playlist.playlist_comments.count
    end

    def destroy
      @playlist = Playlist.find(params[:id])
      comment = PlaylistComment.find(params[:playlist_id])
      comment.destroy
      @comment_count = @playlist.playlist_comments.count
    end

    private

    def comment_params
      params.require(:playlist_comment).permit(:user_id, :playlist_id, :comment)
    end

    def comment_correct_user
      comment = PlaylistComment.find(params[:playlist_id])
        if comment.user_id != current_user.id
          redirect_to user_path(current_user)
        end
    end

end
