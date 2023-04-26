class Api::ApplicationController < ActionController::API
    include ActionController::RequestForgeryProtection
    before_action :authenticate_user
  
    private
  
    def authenticate_user
      @current_user = User.find_by(id: session[:user_id])
      render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized unless @current_user
    end
  end