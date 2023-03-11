module Api
  
  class UsersController < ApplicationController


    def index
      users = User.order('created_at')

      render json: {

        status: 'YES!',
        message: 'Users loaded',
        data: users
      }, status: :ok
    end

    def new
        @user = User.new(user_params)
    end

    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to users_path
        else
            # render "PONER PAGINA QUE DEBE IR"
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
          redirect_to users_path
        end
    end
    
    def user_params
        params.require(:user).permit(:email, :password, :phone)
    end
  end
end