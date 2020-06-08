class Api::V1::SessionsController < ApplicationController
  def create

  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
