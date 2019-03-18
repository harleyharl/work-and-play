class BusinessesController < ApplicationController

  def index
    if !session[:business_id].blank?
      @business = Business.find_by(id: session[:business_id])
      redirect_to business_locations_path(@business)
    else
      redirect_to new_session_path
    end
  end

  def spotify_user
    # binding.pry
    spotify_user = RSpotify::User.new(request.env['omniauth.auth']) #stores user's spotify data as spotify_user
    @business = Business.find_or_create_by(email_address: spotify_user.email) do |b| #finds or creates new business object using spotify id
      # b.email_address = spotify_user.email #sets business' email as spotify email
      b.name = spotify_user.display_name #sets business' name as spotify name
      b.uid = spotify_user.id
    end

    spotify_user.playlists.each do |playlist| #begins iteration over each of spotify_user's playlist objects and
      s_playlist = Playlist.new(name: playlist.name.to_s) #creates a new Playlist for each object
      s_playlist.business = @business #associates the Playlist with the business
      s_playlist.save #saves the Playlist object
        playlist.tracks.each do |track| #iterates over each track in the playlist
          song = Song.new(name: track.name, artist: track.artists.first.name) #creates a new Song object for each track in the playlist
          song.playlist = s_playlist #saves the song in the newly created playlist object
          s_playlist.songs << song #saves the song in the newly created playlist object
          s_playlist.save #saves the playlist
        end
      end
      # binding.pry
    @business.save
    session[:business_id] = @business.id
    redirect_to business_locations_path(@business)
  end

  def new
    if @business = Business.find_by(id: session[:business_id])
      redirect_to business_path(@business)
    else
      @business = Business.new
    end
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      session[:business_id] = @business.id
      redirect_to business_path(@business)
    else
      render :new
    end
  end


  def show
    @business = Business.find_by(id: session[:business_id])
    @location = Location.new
  end

  private

  def business_params
    params.require(:business).permit(:name, :email_address, :password, :password_confirmation)
  end

  def auth
    request.env['omniauth.auth']
  end

end
