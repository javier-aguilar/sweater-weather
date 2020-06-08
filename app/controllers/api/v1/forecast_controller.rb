class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = Location.info(forecast_params[:location])
    if coordinates
      forecast = Forecast.get_info(coordinates)
      render json: ForecastSerializer.new(forecast)
    else
      error
    end
  end

  def forecast_params
    params.permit(:location)
  end

  def error
    data = { errors: [] }
    data[:errors] << { id: 'location', title: 'invalid location' }
    render json: data, status: :unprocessable_entity
  end
end
