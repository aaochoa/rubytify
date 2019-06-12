module Api
  module V1
    class AlbumsController < ApplicationController
      def get_songs
        songs = Album.find(params[:id]).songs.select(:name, :spotify_url, :preview_url, :duration_ms, :explicit).as_json(:except => :id)
        render json: {status: 'SUCCESS', data: songs}, status: :ok
      end
    end
  end
end
