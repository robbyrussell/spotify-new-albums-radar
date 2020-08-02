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

# For each new track released, let's take a quick look at the corresponding album
index = 0
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

  index += 1
  puts "#{index}: #{artist.name} released \"#{track.album.name}\" with #{track.album.tracks.size} songs"
end
