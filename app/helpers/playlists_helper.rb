module PlaylistsHelper
  #
  # def playlist_count(location)
    #add this to below method to make shorter
  #   location.playlists.count
  # end
  #
  def daily_playlist_schedule(location)
    # binding.pry
    # if location.playlists.count == 0
    #   link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0]))
    if location.playlists.count == 1
      link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0]))
    elsif location.playlists.count == 2
      link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0]))
      link_to(location.playlists[1].name, location_playlist_path(location, location.playlists[1]))
    elsif location.playlists.count == 3
      link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0]))
      link_to(location.playlists[1].name, location_playlist_path(location, location.playlists[1]))
      link_to(location.playlists[2].name, location_playlist_path(location, location.playlists[2]))
    elsif location.playlists.count == 4
      link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0]))
      link_to(location.playlists[1].name, location_playlist_path(location, location.playlists[1]))
      link_to(location.playlists[2].name, location_playlist_path(location, location.playlists[2]))
      link_to(location.playlists[3].name, location_playlist_path(location, location.playlists[3]))
    elsif location.playlists.count == 5
      # binding.pry
      link_to(location.playlists[0].name, location_playlist_path(location, location.playlists[0])) +
      link_to(location.playlists[1].name, location_playlist_path(location, location.playlists[1])) +
      link_to(location.playlists[2].name, location_playlist_path(location, location.playlists[2])) +
      link_to(location.playlists[3].name, location_playlist_path(location, location.playlists[3])) +
      link_to(location.playlists[4].name, location_playlist_path(location, location.playlists[4]))
    end
  end
end
