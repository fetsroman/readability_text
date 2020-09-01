class ApiController < ActionController::API
  require 'json_web_token'
  include CanCan::ControllerAdditions

  def current_user
    @current_user
  end

  def authorize_request
    @header = request.headers['Authorization']
    @header = @header.split(' ').last if @header
    begin
      @decoded = JsonWebToken.decode(@header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private

  rescue_from CanCan::AccessDenied do |exception|
    render json: { errors: exception.message }, status: 403
  end
end
