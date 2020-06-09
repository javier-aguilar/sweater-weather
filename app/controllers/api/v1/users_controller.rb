class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(users_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      message = user.errors.full_messages.to_sentence
      error(:bad_request, 400, message)
    end
  end

  private

  def users_params
    params.permit(:email, :password, :password_confirmation)
  end
end
