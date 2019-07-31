class Song < ApplicationRecord
  belongs_to :album
  has_one :artist, :through => :album
  validates :name, presence: true
  validates :spotify_url, presence: true

  scope :by_album_id_eq, proc { |album_id|
    if album_id.present?
      where(album_id: album_id)
    end
  }

  scope :by_genre_name_eq, proc { |genre|
    if genre.present?
      joins(:artist).where('artists.genres like ?', "%#{genre}%")
                    .offset(
                      rand(Song.joins(:artist)
                               .where('artists.genres like ?', "%#{genre}%")
                               .count
                          )
                    )

    end
  }

  def self.get_all(params)
    query = all
    query = params.apply_filters(query)
    PaginateList
      .get_all_paginate(
        query,
        params.pagination_limit,
        params.pagination_number,
        SongSerializer)
  end

end
