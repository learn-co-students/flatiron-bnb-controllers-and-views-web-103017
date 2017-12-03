class ReservationsController < ApplicationController
def show
  @reservation = Reservation.find(params[:id])
end

def update
  @reservation = Reservation.find(params[:id])
  @reservation.update(params.require(:reservation).permit(:status))
  @reservation.save
  redirect_to user_path(@reservation.listing.host)
end

end
