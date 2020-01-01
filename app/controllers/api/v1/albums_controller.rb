class Api::V1::AlbumsController < ApplicationController
  #get all songs of an album
=begin
  def get_songs
    songs = Album.find(params[:id]).songs.select(:name, :spotify_url, :preview_url, :duration_ms, :explicit).as_json(:except => :id)
    if !songs.empty?
      render json: {status: 'SUCCESS', data: songs}, status: :ok
    else
      render json: {status: 'FAILED', data: {name: 'Album not found.'}}, status: :unprocessable_entity
    end
  end
=end
  def index
    parameters =  AlbumParams.new
    parameters.parse_query_string(params)

    render json: Album.get_all(parameters),
           status: :ok
  end

end
