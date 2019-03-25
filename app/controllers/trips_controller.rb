class TripsController < ApplicationController
  before_action :authorize!, only: [:create]

  def show
    @user = User.find_by(params[:username])
    @trip = @user.trips
    render json: @trip
  end

  def create
    byebug
    @user = current_user
    @trip = @user.trips.build(trip_params)
    if @trip.save
      render json: @trip, status: :created
    else
      render json: { erros: @trip.trips.erros.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def trip_params
    params.permit(:leavingat, :arrivingat, :arvdisplay, :dptdisplay, :fltPrc, :hotelname, :hotelprice, :hotelphone, :hoteladdress)
  end
end
