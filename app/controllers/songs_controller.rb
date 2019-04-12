class SongsController < ApplicationController
  before_action :require_login

  def destroy
    @playlist = Playlist.find_by(id: params[:playlist_id])
    Song.find_by(id: params[:song_id]).destroy
    @playlist.save
    redirect_to playlist_path(@playlist)
  end

end
