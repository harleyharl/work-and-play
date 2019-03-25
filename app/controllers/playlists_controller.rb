class PlaylistsController < ApplicationController
  def index
    @business = Business.find_by(id: session[:business_id])
    @location = Location.find_by(id: params[:location_id])
    @playlists = @business.playlists.all
  end

  def create
  end

  def show
    if params[:location_id] #deals with different URLS - location_playlist or business_playlist
      @business = Business.find_by(id: session[:business_id])
      @location = Location.find_by(id: params[:location_id])
      @playlist = Playlist.find_by(id: params[:id])
    else
      @business = Business.find_by(id: session[:business_id])
      @playlist = Playlist.find_by(id: params[:id])
    end
  end

  def destroy
    # binding.pry
    @location = Location.find_by(id: params[:location_id])
    Playlist.find_by(id: params[:id]).destroy
    redirect_to location_path(@location)
  end

end
