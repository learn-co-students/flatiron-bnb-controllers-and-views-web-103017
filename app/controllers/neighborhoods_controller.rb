class NeighborhoodsController < ApplicationController


  def city_show
  
    @neighborhood = Neighborhood.find(params[:neighborhood][:neighborhood_id])
    render :show
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end
end
