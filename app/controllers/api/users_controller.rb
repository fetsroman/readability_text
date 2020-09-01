class Api::UsersController < ApiController
  # POST /sign_up
  def create
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode({ user_id: @user.id, exp: 1.month.from_now.to_i })

      render json: {
          token: token,
          user: @user
      }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
