class UsersController < ApplicationController
  def create
    @user = User.create(name: params[:name])
    @listing = params[:listing]
    @reservation = Reservation.create(check_in: params[:start_date].to_date, check_out: params[:end_date].to_date, listing_id: params[:listing], guest_id: @user.id)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end
  
end
