class CitiesController < ApplicationController
  def index
    
    @cities = City.all
    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date
  end
end
