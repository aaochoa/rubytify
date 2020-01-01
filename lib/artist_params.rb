class ArtistParams < Params
    def initialize
      @filterable_field_list = []
      @sortable_field_list = []
      @filter_by = []
      @sort_by = []
      @pagination_limit = 50
      @pagination_number = 1
    end
  end