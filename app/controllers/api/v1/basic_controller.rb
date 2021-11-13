class Api::V1::BasicController < ApplicationController
  def town
    citys = ApiPtxData.new.get_citys
    render json: citys
  end

  def scenicspots
    scenicspots = ApiPtxData.new.get_scenicspots(query_set(params[:city]))
    render json: { type: 'scenicspots', data: scenicspots }
  end

  def activities
    activities = ApiPtxData.new.get_activities(query_set(params[:city]))
    render json: { type: 'activities', data: activities }
  end

  def restaurants
    restaurants = ApiPtxData.new.get_restaurants(query_set(params[:city]))
    render json: { type: 'restaurants', data: restaurants }
  end

  def hotels
    hotels = ApiPtxData.new.get_hotels(query_set(params[:city]))
    render json: { type: 'hotels', data: hotels }
  end

  private

  def query_set(city = nil)
    if city
      {
        select: "ID, Name, Picture, Description",
        filter: [["Address"], [city]]
      }
    else
      {
        select: "ID, Name, Picture, Description"
      }
    end
  end
end