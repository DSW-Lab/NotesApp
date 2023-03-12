module Api
  
  class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action  :set_user, except: [:index,:create]

    def set_user
      @user = User.find(params[:id])
    end
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

    def create
      @user = User.new(user_params)
    
      if @user.save
        render json: { status: 'YES!', message: 'User created', data: @user }, status: :ok
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
    
    private

    def user_params
      params.require(:user).permit(:email, :firstname, :lastname, :password, :confirmpassword)
    end
    


    

  end
end