class Api::V1::LocalDataController < ApplicationController
  def update
    local_data = LocalDatum.find_by_ptx_data_id(params[:id])
    if (params[:heart])
      local_data.update!(favorite_count: local_data.favorite_count + 1)
    else
      local_data.update!(favorite_count: local_data.favorite_count - 1) if (local_data.favorite_count != 0)
    end
    render json: { status: true }
  end
end