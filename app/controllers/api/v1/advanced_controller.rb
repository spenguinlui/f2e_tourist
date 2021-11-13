class Api::V1::AdvancedController < ApplicationController
  def keyword_search
    # 單一關鍵字
    key_word = keyword_with_tag(params[:keyword])
    activities = ApiPtxData.new.get_activities({top: 3, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    restaurants = ApiPtxData.new.get_restaurants({top: 3, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    hotels = ApiPtxData.new.get_hotels({top: 3, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    scenicspots = ApiPtxData.new.get_scenicspots({top: 3, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    responce_data = {
      scenicspots: scenicspots,
      activities: activities,
      restaurants: restaurants,
      hotels: hotels
    }
    render json: responce_data
  end

  private

  def keyword_with_tag(keyword)
    tag = nil  # 這要從 DB 抓陣列 Tags.where("name = ?",  keyword)
    if (tag)
      # return tag << keyword
    else
      [keyword]
    end
  end

end