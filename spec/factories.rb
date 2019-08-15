FactoryBot.define do

  factory :artist do
    name { Faker::Artist.name }
    image { Faker::JapaneseMedia::DragonBall.character }
    genres { Faker::Creature::Animal.name }
    spotify_url { Faker::Name.unique.name }
    spotify_id { Faker::Blockchain::Bitcoin.address }
    popularity {Faker::Number.number(2)}
    trait :with_album do
      after(:create) do |artist|
        create(:album, artist_id: artist.id)
      end
    end
  end

  factory :album do
    association :artist, :factory => :artist
    name { Faker::Music.album }
    image { Faker::LoremFlickr.image }
    spotify_url { "https://open.spotify.com/album/3oQYd91IYBHAdiidMFbsdW" }
    spotify_id { Faker::Name.unique.name }
    total_tracks {Faker::Number.between(1,15)}
    trait :with_song do
      after(:create) do |album|
        create(:song, album_id: album.id)
      end
    end
  end

  factory :song do
    association :album, :factory => :album
    name { Faker::Music::UmphreysMcgee.song }
    explicit { false }
    preview_url { Faker::Name.unique.name }
    spotify_url { Faker::Name.name }
    spotify_id { Faker::Name.unique.name }
    duration_ms {Faker::Number.between(1, 10000)}
  end
end
