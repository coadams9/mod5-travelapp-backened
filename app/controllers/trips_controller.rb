class TripsController < ApplicationController
  before_action :authorize!, only: [:create]

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: @trip, status: :created
    else
      render json: { erros: @trip.erros.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def trip_params
    params.permit(:name)
  end

end
