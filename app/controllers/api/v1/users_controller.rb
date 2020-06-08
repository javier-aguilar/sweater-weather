class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(users_params)
    binding.pry
    if user.save

    else
    end
  end

  def users_params
    params.permit(:email, :password, :password_confirmation)
  end
end
