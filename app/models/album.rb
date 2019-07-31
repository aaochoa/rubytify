class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true
  validates :spotify_url, presence: true

  scope :by_artist_id_eq, proc { |artist_id|
    if artist_id.present?
      where(artist_id: artist_id)
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
        AlbumSerializer)
  end
  
end
