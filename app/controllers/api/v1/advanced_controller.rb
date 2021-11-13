class Api::V1::AdvancedController < ApplicationController
  def keyword_search
    # 單一關鍵字
    key_word = keyword_with_tag(params[:keyword])
    query_obj = {
      top: 3,
      select: "ID, Name, Picture",
      filter: [["Name", "Description"], key_word]
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

  def search_with_all_type(query_obj)
    activities = ApiPtxData.new.get_activities(query_obj)
    restaurants = ApiPtxData.new.get_restaurants(query_obj)
    hotels = ApiPtxData.new.get_hotels(query_obj)
    scenicspots = ApiPtxData.new.get_scenicspots(query_obj)
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

end