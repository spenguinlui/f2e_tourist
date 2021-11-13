class Api::V1::AdvancedController < ApplicationController
  def keyword_search
    # 單一關鍵字
    key_word = keyword_with_tag(params[:keyword])
    query_obj = {
      top: 3,
      select: "ID, Name, Picture",
      filter: [["Name", "Description"], key_word]
    }
    responce_data = search_with_all_type(query_obj) do |data_ary|
      data_ary.map { |data| set_search_count_to_local_datum(data) }
    end

    render json: responce_data
  end

  def hot
    local_datum = LocalDatum.order('search_count + enter_count DESC').limit(6)
    ids = []
    local_datum.map do |data|
      ids << data.ptx_data_id
    end
    query_obj = {
      top: 6,
      select: "ID, Name, Picture",
      filter: [["ID"], ids]
    }
    responce_data = search_with_all_type(query_obj)
    render json: responce_data
  end

  def theme
    @tag = Tag.limit(1).order("RANDOM()")[0]
    query_obj = {
      top: 6,
      select: "ID, Name, Picture",
      filter: [["Name", "Description"], @tag.collections]
    }
    responce_data = search_with_all_type(query_obj)
    render json: { theme_name: @tag.theme_name, data: responce_data }
  end

  private

  def search_with_all_type_key_word(query_obj)
    activities = ApiPtxData.new.get_activities(query_obj)
    restaurants = ApiPtxData.new.get_restaurants(query_obj)
    hotels = ApiPtxData.new.get_hotels(query_obj)
    scenicspots = ApiPtxData.new.get_scenicspots(query_obj)
    set_search_count_to_local_datum(activities)
    set_search_count_to_local_datum(restaurants)
    set_search_count_to_local_datum(hotels)
    set_search_count_to_local_datum(scenicspots)
    {
      scenicspots: scenicspots,
      activities: activities,
      restaurants: restaurants,
      hotels: hotels
    }
  end

  def search_with_all_type(query_obj)
    activities = ApiPtxData.new.get_activities(query_obj)
    restaurants = ApiPtxData.new.get_restaurants(query_obj)
    hotels = ApiPtxData.new.get_hotels(query_obj)
    scenicspots = ApiPtxData.new.get_scenicspots(query_obj)
    if block_given?
      yield([activities, restaurants, hotels, scenicspots])
    end
    {
      scenicspots: scenicspots,
      activities: activities,
      restaurants: restaurants,
      hotels: hotels
    }
  end

  def keyword_with_tag(keyword)
    tag = Tag.where("name = ?",  keyword)[0]
    if (tag)
      tag.collections << keyword
    else
      [keyword]
    end
  end

  def set_search_count_to_local_datum(data_list)
    data_list.map do |data|
      local_datum = LocalDatum.find_by_ptx_data_id(data["ID"])
      if local_datum
        local_datum.update!(search_count: local_datum.search_count + 1)
      else
        LocalDatum.create!(ptx_data_id: data["ID"], search_count: 1)
      end
    end
  end
end