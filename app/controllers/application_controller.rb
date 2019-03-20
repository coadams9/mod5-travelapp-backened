class ApplicationController < ActionController::API

  def current_user
    encoded_token = request.headers['Access-Token']
    return nil unless encoded_token.present?
    decoded_token = JWT.decode(encoded_token, ENV['SECRET']).first
    User.find(decoded_token['userId'])
  end

  def authorize!
    unless current_user
      render json: { error: 'You must be logged in to do that. Please login and try again!' }, status: :unauthorized
    end
  end

end
