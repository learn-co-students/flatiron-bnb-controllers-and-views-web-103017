class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params(:title, :description))
    
  end

  def show

  end

  private

  def listing_params(*args)
    params.require(:listing).permit(*args)
  end
end
