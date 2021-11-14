class Api::V1::DetailController < ApplicationController
  def scenicspots
    id = params[:id]
    scenicspots = ApiPtxData.new.get_scenicspots({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(scenicspots, "scenicspots")
    render json: scenicspots[0]
  end
  
  def activities
    id = params[:id]
    activities = ApiPtxData.new.get_activities({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(activities, "activities")
    render json: activities[0]
  end

  def restaurants
    id = params[:id]
    restaurants = ApiPtxData.new.get_restaurants({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(restaurants, "restaurants")
    render json: restaurants[0]
  end

  def hotels
    id = params[:id]
    hotels = ApiPtxData.new.get_hotels({filter: [["ID"], [id]]})
    set_enter_count_to_local_datum(hotels, "hotels")
    render json: hotels[0]
  end

  private

  def set_enter_count_to_local_datum(data_list, data_type)
    data_list.map do |data|
      Tag.find_each do |tag|
        tag_collections = tag.collections
        if data["Description"]
          is_tag_include = ((tag_collections.any? { |tag| data["Name"].include?(tag)}) || (tag_collections.any? { |tag| data["Description"].include?(tag)}))
        else
          is_tag_include = tag_collections.any? { |tag| data["Name"].include?(tag)}
        end
        if is_tag_include
          if data[:Tag]
            data[:Tag].include?(tag.name) || data[:Tag].push(tag.name)
          else
            data.merge!({"Tag": [tag.name]})
          end
        end
      end

      local_datum = LocalDatum.find_by_ptx_data_id(data["ID"])
      if local_datum
        local_datum.update!(enter_count: local_datum.enter_count + 1)
      else
        LocalDatum.create!(ptx_data_id: data["ID"], ptx_data_type: data_type, enter_count: 1)
      end
    end
  end
end