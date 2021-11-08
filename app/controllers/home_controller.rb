class HomeController < ApplicationController
  def index
    @res = ApiPtxData.new.get_tra_station
  end
end