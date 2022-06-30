class AuthController < ApplicationController
  
  def create
    user = User.find_by(username: auth_params[:username])
    secret = Rails.application.secrets.secret_key_base. to_s
    if user && user.authenticate(auth_params[:password])
         token = JWT.encode({user_id: user.id}, secret, 'HS256')
        render json: {user: user, token: token}, status: 200
    else
        render json: {errors: user.errors.full_messages}, status: 404
    end
  end

  # Only allow a list of trusted parameters through.
  def auth_params
    params.permit(:username, :password)
  end

end
