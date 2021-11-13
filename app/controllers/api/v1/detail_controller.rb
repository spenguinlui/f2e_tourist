class Api::V1::DetailController < ApplicationController
  def scenicspots
    id = params[:id]
    scenicspots = ApiPtxData.new.get_scenicspots({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(scenicspots)
    render json: scenicspots[0]
  end
  
  def activities
    id = params[:id]
    activities = ApiPtxData.new.get_activities({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(activities)
    render json: activities[0]
  end

  def restaurants
    id = params[:id]
    restaurants = ApiPtxData.new.get_restaurants({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(restaurants)
    render json: restaurants[0]
  end

  def hotels
    id = params[:id]
    hotels = ApiPtxData.new.get_hotels({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(hotels)
    render json: hotels[0]
  end

  private

  def set_enter_count_to_local_datum(data_list)
    data_list.map do |data|
      local_datum = LocalDatum.find_by_ptx_data_id(data["ID"])
      if local_datum
        local_datum.update!(enter_count: local_datum.enter_count + 1)
      else
        LocalDatum.create!(ptx_data_id: data["ID"], enter_count: 1)
      end
    end
  end
end