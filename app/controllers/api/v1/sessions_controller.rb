class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      render json: UserSerializer.new(user)
    else
      error(:unauthorized, 401, 'Invalid Email or Password')
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
