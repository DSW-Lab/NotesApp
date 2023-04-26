class Api::RegistrationsController < ApplicationController

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
    params.permit(:email, :password, :password_confirmation)
  end
end
