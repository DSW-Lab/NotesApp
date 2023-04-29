class Api::SessionsController < Api::ApplicationController
  skip_before_action  only: [:create]

  def create
    user = User.find_by(email: params[:email].downcase)
    if user.nil?
      render json: { status: 'error', message: 'User not found', data: user}, status: :unauthorized
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      $current_user_id = session[:user_id]
      puts "User ID in session: #{session[:user_id]}"
      # authenticate_user
      render json: { status: 'ok', user: user }
    else
      render json: { status: 'error', message: 'Invalid password', data: user}, status: :unauthorized
    end
  end

  def destroy
    reset_session
    render json: { status: 'ok', message: 'Logged out successfully.' }
  end
end
