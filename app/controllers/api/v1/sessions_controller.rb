class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      render json: UserSerializer.new(user)
    else
      message = 'Invalid Email or Password'
      error(message)
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end

  def error(message)
    render json: { status: :unauthorized,
                   code: 401,
                   message: message }, status: :unauthorized
  end
end
