# frozen_string_literal: true

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspotify'
end

# Let's login to the Spotify API!
RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])

my_user = RSpotify::User.find(ENV['SPOTIFY_USERNAME'])

# Let's find my weekly Release Radar playlist
# NOTE: I had to make my Release Radar playlist 'public' for it to show up
release_radar = my_user.playlists.find { |p| p.name == 'Release Radar' }

new_album_releases = []

# For each new track released, let's take a quick look at the corresponding album
release_radar.tracks.each do |track|
  # Let's skip multi-artist tracks for now
  # These are likely remixes and/or one-off singles
  next if track.artists.size > 1

  artist = track.artists.first

  # Let's assume albums with only one track are singles
  next if track.album.tracks.size == 1

  # TODO: Consider skipping 'Live' and 'Remastered' albums

  # debugging...
  # TODO: could save some API queries with some local caching of data
  new_album_releases << { album: track.album, artist: artist }
end

index = 0

new_album_releases.each do |album_release|
  index += 1

  # TODO: Add each album's tracks to our new playlist
  # release_radar_albums.add_tracks!(album_release[:album].tracks)

  puts "#{index}:\t#{album_release[:artist].name} released \"#{album_release[:album].name}\" on #{album_release[:album].release_date}."
  puts "\t#{album_release[:album].external_urls['spotify']}\n\n"
end

# TODO: Relies on OAuth to modify details that are not public
#
# # Create a new playlist if it doesn't already exist
# release_radar_albums = my_user.playlists.find { |p| p.name == 'ALBUM - Release Radar' }
#
# # Remove all of the previous tracks in our playlist so that we have a clean slate
# previous_tracks = release_radar_albums.tracks
#
# # Spotify limits 100 tracks at a time
# previous_tracks.each_slice(50) do |tracks|
#   release_radar_albums.remove_tracks!(tracks)
# end
