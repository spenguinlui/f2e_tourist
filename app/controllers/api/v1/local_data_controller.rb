class Api::V1::LocalDataController < ApplicationController
  def update
    @local_data = LocalDatum.find_by_ptx_data_id(params[:id])
    @is_add = ActiveModel::Type::Boolean.new.cast(params[:heart])
    @status = false
    if @local_data
      if @is_add
        @local_data.update!(favorite_count: @local_data.favorite_count + 1)
      else
        @local_data.update!(favorite_count: @local_data.favorite_count - 1) if @local_data.favorite_count != 0
      end
      @status = true
    end
    render json: { status: @status }
  end
end