class Api::V1::FoodieController < ApplicationController
  def index
    destination = Travel.info(foodie_params[:start],
                              foodie_params[:end],
                              foodie_params[:search])
    if destination.nil?
      error
    else
      render json: FoodieSerializer.new(destination)
    end
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end

  def error
    data = { errors: [] }
    data[:errors] << { id: 'error', title: 'missing parameter' }
    render json: data, status: :bad_request
  end
end
