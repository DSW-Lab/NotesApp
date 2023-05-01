class Api::RegistrationsController < Api::ApplicationController

<<<<<<< HEAD
  skip_before_action  only: [:create]
=======
  skip_before_action only: [:create]
>>>>>>> c0d318ed961398b6c7552407fe852378ba49e840

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
