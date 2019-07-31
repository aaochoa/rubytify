module PaginateList
  class << self
    def get_all_paginate(query, limit =1, page = 1, serializer)
      data = {}
      total_items = query.size
      query = query.page(page).per(limit)

      data[:data] = ActiveModelSerializers::SerializableResource.new(
        query,
        each_serializer: serializer,
        adapter: :attributes
      )
      data[:pagination] = {
        limit: limit.to_i,
        page: query.current_page,
        next: query.next_page,
        prev: query.prev_page,
        total_items: total_items,
        total_pages: query.total_pages
      }
      data
    end
  end
end
  