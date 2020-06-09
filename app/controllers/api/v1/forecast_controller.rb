class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = Location.info(forecast_params[:location])
    if coordinates
      forecast = Forecast.get_info(coordinates)
      render json: ForecastSerializer.new(forecast)
    else
      error(:bad_request, 400, 'Invalid location')
    end
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
