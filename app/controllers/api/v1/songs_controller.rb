class Api::V1::SongsController < ApplicationController
  # get ramdom song by genre
=begin
  def song_by_genre
    artists = Artist.where("genres ~* ?", params[:genre_name])
    if !artists.empty?
      song = artists.sample.albums.sample.songs.sample.as_json(:except => [:id, :album_id, :updated_at, :created_at, :spotify_id])
      if song.nil?
        song = artists.sample.albums.sample.songs.sample.as_json(:except => [:id, :album_id, :updated_at, :created_at, :spotify_id])
      end
      render json: {status: 'SUCCESS', data: song}, status: :ok
    else
      render json: {status: 'FAILED', data: {name: 'Genre not found.'}}, status: :unprocessable_entity
    end
  end
=end
  def index
    parameters =  SongParams.new
    parameters.parse_query_string(params)
    render json: Song.get_all(parameters),
           status: :ok
  end

  def random_song
    render json: Song.by_genre_name_eq(params[:genre_name]).take,
           serializer: SongSerializer,
           status: :ok
  end

end
