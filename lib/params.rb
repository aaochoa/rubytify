class Params
  attr_accessor :filter_by, :sort_by, :pagination_limit, :pagination_number
  def initialize()
    @filterable_field_list = []
      @sortable_field_list = []

      @filter_by = []
      @sort_by = []
      @search_value = nil
      @pagination_limit = 50
      @pagination_number = 1
  end
  def parse_query_string(params)
    regex = /\w+_+id/
    has_filter = params.has_key?(:filter)
    params.clone.each do |key, value|
      if has_filter && key[regex] == key.to_s
          params[:filter][key] = value
      elsif !has_filter && key[regex] == key.to_s
          params.merge!({filter: {} })
          params[:filter][key] = value
      end
    end
        
    generate_filters(params) if params[:filter].present?
    generate_orders(params) if params[:sort].present?
    
    @search_value = params[:search]
    
    @pagination_limit = params[:page][:limit] if params[:page]
    @pagination_number = params[:page][:number]if params[:page]
  end

  def apply_filters(query)
    @filter_by.each do | filter |
      query = query.public_send("by_#{filter[:key]}_#{filter[:condition]}", filter[:value].to_s)
    end
    query
  end
  
  def apply_orders(query)
    @sort_by.each do | sort |
      query = query.order("#{sort[:key]} #{sort[:direction]}")
    end
    query
  end
  
  def to_meta
    {
      filters: @filterable_field_list,
      sort: @sortable_field_list,
      default_limit: @pagination_limit
    }
  end

    private

    def generate_filters(params)
      @filter_by = []
      @filterable_field_list.each do |field|
        value = params[:filter][field.to_sym] || nil
        if value
          condition = field.split('__')
          field, condition = condition.length > 1 ? condition : [field, 'eq']
          @filter_by.push(
            {
              key: field,
              value: value,
              condition: condition
            })
        end
      end
    end

    def generate_orders(params)
      @sort_by = []
      @sortable_field_list.each do |field|
      sort_value = params[:sort][field.to_sym]
      if sort_value
        direction = sort_value.downcase == 'asc' ? 'asc' : 'desc'
        @sort_by.push({
          key: field,
          direction: direction
        })
      end
    end
  end
end