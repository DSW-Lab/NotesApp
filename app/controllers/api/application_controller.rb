module Api
    class ApplicationController < ActionController::Base
        include ActionController::RequestForgeryProtection
        
        protect_from_forgery with: :null_session
        before_action :authenticate_user
    
        private

        def authenticate_user
            @current_user = User.find_by(id: cookies.signed[:_NotesApp_session])
            render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized unless @current_user
        end
    end
end