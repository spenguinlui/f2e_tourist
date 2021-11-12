class Api::V1::AdvancedController < ApplicationController
  def keyword_search
    # 單一關鍵字
    key_word = keyword_with_tag(params[:keyword])
    activities = ApiPtxData.new.get_activities({top: 6, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    restaurants = ApiPtxData.new.get_restaurants({top: 6, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    hotels = ApiPtxData.new.get_hotels({top: 6, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    scenic_spots = ApiPtxData.new.get_scenic_spots({top: 6, select: "ID, Name, Picture", filter: [["Name", "Description"], key_word]})
    responce_data = {
      scenicspots: scenic_spots,
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