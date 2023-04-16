class SessionsController < ApplicationController
    def new
    end
    
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in user
        params[:remember_me] == '1' ? remember(user) : forget(user)
        flash.now[:alert] = "email/password combination"
        redirect_to root_path
      else
        flash.now[:alert] = "Invalid email/password combination"
        render :new
      end
    end
    
    def destroy
      log_out if logged_in?
      redirect_to root_url
    end
  end
  