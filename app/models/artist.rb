class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, through: :albums

  validates :name, presence: true
  validates :spotify_url, presence: true

  default_scope {order(popularity: :desc)}

  def self.get_all(params)
      query = all
      PaginateList
        .get_all_paginate(
          query,
          params.pagination_limit,
          params.pagination_number,
          ArtistSerializer)
  end
  
end
