class TripsController < ApplicationController
  before_action :authorize!, only: [:create]

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(:include => :trips)
  end

  def create
    @user = current_user
    @trip = @user.trips.build(trip_params)
    if @trip.save
      render json: @trip, status: :created
    else
      render json: { erros: @trip.trips.erros.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
  end


  private
  def trip_params
    params.permit(:leavingat, :arrivingat, :arvdisplay, :dptdisplay, :fltPrc, :hotelname, :hotelprice, :hotelphone, :hoteladdress)
  end
end
