class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = Location.info(forecast_params[:location])
    forecast = Forecast.get_info(coordinates)
    render json: ForecastSerializer.new(forecast)
  end

  def forecast_params
    params.permit(:location)
  end
end
