module Api
    class ApplicationController < ActionController::Base
        include ActionController::RequestForgeryProtection
        
        protect_from_forgery with: :null_session
        # before_action :authenticate_user

        # private

    
        # def authenticate_user
        #     @current_user = User.find_by(id: session[:user_id])
        #     puts "@current_user: #{@current_user}"
        #     render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized unless @current_user
        # end

        # def encode_token(payload)
        #     JWT.encode(payload, 'yourSecret')
        # end
    
        # def auth_header
        #     # { Autorization: 'Bearer <token>' }
        #     request.headers['Authorization']
        # end
    
        # def decoded_token
        #     if auth_header
        #         token = auth_header.split(' ')[1]
        #         # header: { 'Authorization': 'Bearer <token'> }
        #         begin
        #             JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
        #         rescue JWT::DecodeError
        #             nil
        #         end
        #     end
        # end
    
        # def logged_in_user
        #     if decoded_token
        #         user_id = decoded_token[0]['user_id']
        #         @user = User.find_by(id: user_id)
        #     end
        # end
    
        # def logged_in?
        #     !!logged_in_user
        # end
    
        # def authorized
        #     render json: { message: 'Please log in' }, status: :unauthorized unless
        #     logged_in?
        # end
    end
    
end
