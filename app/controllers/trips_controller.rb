class TripsController < ApplicationController
  before_action :authorize!, only: [:create]

  def create
    @user = current_user
    @user.trip << response.trip.hotelinfo
    @user.trip << response.trip.flightinfo
    @user.trip << response.trip.arv
    @user.trip << response.trip.dpt
    if @user.trip.save
      render json: @user.trip, status: :created
    else
      render json: { erros: @user.trip.erros.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def trip_params
    params.permit(:hotelinfo, :flightinfo, :arv, :dpt)
  end

end
