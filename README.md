# Spotify New Album Release Radar

Each week, Spotify "curates" (aka generates) a playlist of new music from artists
that we follow. While this is a great way to listen to a wide array of new music,
I have been wishing that they would provide a playlist of new (full) albums to
listen to (and then consider seeking out buying it online) to support the artist.

## Prerequisite

To use this tool, you will need a Spotify for Developers account, which you can
get access to https://developer.spotify.com/. You will need to create a new app
and that will provide you with a Spotify client id and secret.


## Usage

This is a basic inline Ruby script that relies on the RSpotify gem.

    $ git clone ....

Reference the Spotify API credentials here:

    $ export SPOTIFY_CLIENT_ID=<<your spotify client id>>
    $ export SPOTIFY_CLIENT_SECRET=<<your spotify secret>>
    $ export SPOTIFY_USERNAME=<<your spotify username>>

Example:

    $ export SPOTIFY_CLIENT_ID=987654321THEMIGHTYMISSOULA123456
    $ export SPOTIFY_CLIENT_SECRET=987654321POSTROCKFROMPORTLAND123456
    $ export SPOTIFY_USERNAME=robbyrussell

Running the tool:

    $ ruby spotify_new_albums_release_radar.rb


![Example proof-of-concept](https://monosnap.com/image/niZy5suMeiyIHcOTxALb9nFsIBAt5g)

## Notes

> "Why can't I just listen to all the new albums front-to-end?" -- me, yesterday

This was a scratch-my-own-itch project that I kept wishing for while on long
car rides.
