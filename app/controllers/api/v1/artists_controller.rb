class Api::V1::ArtistsController < ApplicationController
  #Get artists and order them by popularity
=begin
  def index
    artists = Artist.select(:id, :name, :image, :genres, :popularity, :spotify_url).order('popularity DESC')

    if artists.any?
      render json: {status: 'SUCCESS', data: artists}, status: :ok
    else
      render json: {status: 'FAILED', data: 'No artists saved'}, status: :unprocessable_entity
    end
  end

  # Get all artist albums
  def get_albums
    albums = Artist.find(params[:id]).albums.select(:id, :name, :image, :spotify_url, :total_tracks)
    if !albums.empty?
      render json: {status: 'SUCCESS', data: albums}, status: :ok
    else
      render json: {status: 'FAILED', data: {name: 'Artist not found.'}}, status: :unprocessable_entity
    end
  end
=end
  def index
    parameters =  AlbumParams.new
    parameters.parse_query_string(params)

    render json: Artist.get_all(parameters),
           status: :ok
  end

end
