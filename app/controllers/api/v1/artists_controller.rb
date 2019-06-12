module Api
  module V1
    class ArtistsController < ApplicationController
      def index
        artists = Artist.select(:id, :name, :image, :genres, :popularity, :spotify_url).order('popularity DESC')
        render json: {status: 'SUCCESS', data: artists}, status: :ok
      end

      def get_albums
        albums = Artist.find(params[:id]).albums.select(:id, :name, :image, :spotify_url, :total_tracks)
        render json: {status: 'SUCCESS', data: albums}, status: :ok
      end
    end
  end
end
