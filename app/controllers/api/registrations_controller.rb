class Api::RegistrationsController < Api::ApplicationController

  skip_before_action :authenticate_user, only: [:create]

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: { status: 'ok', user: user }
    else
      render json: { status: 'error', errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
