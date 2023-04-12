class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

    def new
        @user = User.new(user_params)
    end

    def show
      @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            # render "PONER PAGINA QUE DEBE IR"
        end
    end


    def edit
      @user = User.find(params[:id])
    end
  

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path
      else
        # render "pagina donde tiene que ir"
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to users_path
      end
    end

    private    

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :phone)
      end
    end