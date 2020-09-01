class Api::AuthenticationController < ApiController
  # POST /sign_in
  def sign_in
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode({user_id: @user.id, exp: 1.month.from_now.to_i })

      render json: { token: token, user: @user }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
