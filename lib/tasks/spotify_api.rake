require 'rspotify'
require 'yaml'

RSpotify.authenticate('04bbe1c429004d059db4d779f7b07ef1', 'f4ba6691b34648b7813dd454cf783509')

namespace :spotify_api do
  desc "TODO"
  task get_data: :environment do
    file = YAML::load(File.open('config/artists.yml'))
    file["artists"].each do |artist|
      people = RSpotify::Artist.search(artist)
      thing = people.first
      puts {name: thing.name,
            image: thing.images.first,
            genres: thing.genres.to_s,
            popularity: thing.popularity,
            spotify_url: thing.external_urls,
            spotify_id: thing.id}.to_s
    end
  end

end
