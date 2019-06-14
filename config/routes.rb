Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      get 'artists', to: 'artists#index'
      get 'artists/:id/albums', to: 'artists#get_albums'
      get 'albums/:id/songs', to: 'albums#get_songs'
      get 'genres/:genre_name/random_song', to: 'genres#song_by_genre'
    end
  end

end
