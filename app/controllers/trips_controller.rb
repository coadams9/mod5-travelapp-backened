class TripsController < ApplicationController
  before_action :authorize!, only: [:create]

  def create
    byebug
    @user = current_user
    @trip = @user.trips.build(trip_params)
    # @user.trips << params['hotelinfo']
    # @user.trips << params['flightinfo']
    # @user.trips << params['arv']
    # @user.trips << params['dpt']
    # @user.trips << params['fltPrc']
    if @trip.save
      render json: @trip, status: :created
    else
      render json: { erros: @trip.trips.erros.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def trip_params
    params.require(:hotelinfo).require(:cheapestProvider).permit(:name)
  end
end
