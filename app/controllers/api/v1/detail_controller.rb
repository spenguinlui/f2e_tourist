class Api::V1::DetailController < ApplicationController
  def scenic_spots
    id = params[:id]
    scenic_spots = ApiPtxData.new.get_scenic_spots({filter: ["ID", id]})
    render json: scenic_spots[0]
  end
  
  def activities
    id = params[:id]
    activities = ApiPtxData.new.get_activities({filter: ["ID", id]})
    render json: activities[0]
  end

  def restaurants
    id = params[:id]
    restaurants = ApiPtxData.new.get_restaurants({filter: ["ID", id]})
    render json: restaurants[0]
  end

  def hotels
    id = params[:id]
    hotels = ApiPtxData.new.get_hotels({filter: ["ID", id]})
    render json: hotels[0]
  end
end