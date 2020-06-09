class ApplicationController < ActionController::API
  def require_api_key
    user = User.find_by(api_key: params[:api_key])
    return error if user.nil?
  end

  private

  def error
    render json: { status: :unauthorized,
                   code: 401,
                   message: 'Invalid api key' }, status: :unauthorized
  end
end
