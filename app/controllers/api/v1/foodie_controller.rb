class Api::V1::FoodieController < ApplicationController
  def index
    destination = Travel.get_info(foodie_params[:start], foodie_params[:end])
    render json:FoodieSerializer.new(destination)
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
