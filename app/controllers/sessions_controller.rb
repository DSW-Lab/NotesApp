class SessionsController < ApplicationController
    respond_to :json

    def new
        @user= user.new
    end
    
      
    def create
      user = User.find_by(email: params[:email])
      if user && user.valid_password?(params[:password])
        sign_in(user)
        render json: { success: true, message: "valid email or password" }
      else
        render json: { success: false, message: "Invalid email or password" }
      end
    end
      
    def destroy
      log_out if logged_in?
        render json: { success: true }
    end
end
  