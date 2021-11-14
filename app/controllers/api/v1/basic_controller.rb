class Api::V1::BasicController < ApplicationController
  def town
    citys = ApiPtxData.new.get_citys
    render json: citys
  end

  def scenicspots
    scenicspots = ApiPtxData.new.get_scenicspots(query_set(params[:city]))
    scenicspots = set_tag_on_data_list(scenicspots, 'scenicspots')
    render json: { type: 'scenicspots', data: scenicspots }
  end

  def activities
    activities = ApiPtxData.new.get_activities(query_set(params[:city]))
    activities = set_tag_on_data_list(activities, 'activities')
    render json: { type: 'activities', data: activities }
  end

  def restaurants
    restaurants = ApiPtxData.new.get_restaurants(query_set(params[:city]))
    restaurants = set_tag_on_data_list(restaurants, 'restaurants')
    render json: { type: 'restaurants', data: restaurants }
  end

  def hotels
    hotels = ApiPtxData.new.get_hotels(query_set(params[:city]))
    hotels = set_tag_on_data_list(hotels, 'hotels')
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

  def set_tag_on_data_list(data_list, data_type)
    data_list = data_list.map do |data|
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
      # 先不建立
      # local_datum = LocalDatum.find_by_ptx_data_id(data["ID"])
      # if local_datum
      #   local_datum.update!(enter_count: local_datum.enter_count + 1)
      # else
      #   LocalDatum.create!(ptx_data_id: data["ID"], ptx_data_type: data_type, enter_count: 1)
      # end
      data
    end
    data_list
  end
end