class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  # def neighborhood_show
  #   redirect_to "neighborhoods/#{params[:neighborhood][:neighborhood_id]}"
  # end


  def show
    @city = City.find(params[:id])
  end

end
