class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(users_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      message = user.errors.full_messages.to_sentence
      error(message)
    end
  end

  private

  def users_params
    params.permit(:email, :password, :password_confirmation)
  end

  def error(message)
    render json: { status: :bad_request,
                   code: 400,
                   message: message }, status: :bad_request
  end
end
