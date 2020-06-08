class Api::V1::BackgroundsController < ApplicationController
  def index
    background = Background.find("#{backgrounds_params[:location]} location")
    render json: BackgroundSerializer.new(background)
  end

  def backgrounds_params
    params.permit(:location)
  end
end
