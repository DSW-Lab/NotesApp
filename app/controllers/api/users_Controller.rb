  module Api
    class UsersController < ApplicationController

      # before_action :authorized, only: [:auto_login]

      # skip_before_action :verify_authenticity_token
      before_action  except: [:index,:create]
  
  
      def index
        users = User.order('created_at')
  
        render json: {
  
          status: 'YES!',
          message: 'Users loaded',
          data: users
        }, status: :ok
      end
  
      def show
        
        @User =User.find(params[:id])
        render json: {
  
          status: 'YES!',
          message: 'User loaded',
          data: @User
        }, status: :ok
      end

      def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        return @current_user
      end
  
      # REGISTER
      def create
        @user = User.new(user_params)
      
        if @user.save
          # token = encode_token({user_id: @user.id})
          render json: { status: 'YES!', message: 'User created', user: @user }, status: :ok
        else
          render json: { status: 'error', message: 'User not created', data: @user.errors }, status: :unprocessable_entity
        end
      end
      
      def destroy
        @user = User.find(params[:id])
  
        if @user.destroy
          render json: { status: 'YES!', message: 'User eliminated', data: @user }, status: :ok
        else
          render json: { status: 'error', message: 'User not eliminated', data: @user.errors }, status: :unprocessable_entity
        end
      end
      
      def update
        @user = User.find(params[:id])
  
        if @user.update(user_params)
          render json: { status: 'YES!', message: 'User updated', data: @user }, status: :ok
        else
          render json: { status: 'error', message: 'User not updated', data: @user.errors }, status: :unprocessable_entity
        end
      end

      # LOGGING
      def login
        @user = User.find_by(email: params[:email])
        
        # Poner luego la contraseña
        #if @user && @user.authenticate(params[:password])
        if @user 
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid email or password"}
        end
      end

      def auto_login
        render json: @user
      end
  
      private
  
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
  
  
    end
  
  end
