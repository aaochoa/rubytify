module Api
  module V1
    class GenresController < ApplicationController
      def song_by_genre
        artists = Artist.where("genres ~* ?", params[:genre_name])
        albums = artists.sample
        song = albums.sample.songs
        raise song.inspect
      end
    end
  end
end
