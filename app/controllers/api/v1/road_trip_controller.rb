class Api::V1::RoadTripController < ApplicationController
  before_action :require_api_key

  def create
    trip = Trip.info(roadtrip_params[:origin], roadtrip_params[:destination])
    render json: TripSerializer.new(trip)
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
end
