class ApplicationController < ActionController::API
  def require_api_key
    user = User.find_by(api_key: params[:api_key])
    return error(:unauthorized, 401, 'Invalid api key') if user.nil?
  end

  private

  def error(status, code, message)
    render json: { status: status,
                   code: code,
                   message: message }, status: status
  end
end
