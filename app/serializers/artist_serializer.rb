class ArtistSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :image,
             :genres,
             :popularity,
             :spotify_url

  def genres
    JSON(object.genres)
  end
end
