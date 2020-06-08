class Api::V1::FoodieController < ApplicationController
  def index
    destination = Travel.get_info(foodie_params[:start], foodie_params[:end])
    binding.pry
    # use end param to find a restaurant
    # return json
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
