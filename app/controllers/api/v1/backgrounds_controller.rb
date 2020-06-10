class Api::V1::BackgroundsController < ApplicationController
  def index
    return error(:bad_request, 400, 'Location required') unless backgrounds_params[:location]

    background = Background.find("#{backgrounds_params[:location]} location")
    render json: BackgroundSerializer.new(background)
  end

  private

  def backgrounds_params
    params.permit(:location)
  end
end
