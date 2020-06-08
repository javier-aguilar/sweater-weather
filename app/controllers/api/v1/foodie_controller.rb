class Api::V1::FoodieController < ApplicationController
  def index
    destination = Travel.info(foodie_params[:start],
                                  foodie_params[:end],
                                  foodie_params[:search])
    render json: FoodieSerializer.new(destination)
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
