class RegistrationsController < ApplicationController
    #before_action :log_in_redirect, only: [:new, :create]

    def new
        @user = User.new
    end
    def create
        #byebug
        @user = User.new(user_params)
        if @user.save
            #WelcomeUserMailer.with(user: @user).welcome_user_email.deliver_now
            # stores saved user id in a session
            #session[:user_id] = @user.id
            flash[:alert] = "Registration successfully"
            redirect_to users_path
        else
            render :new
        end
    end
    
    private
    def user_params
      # strong parameters
      params.require(:user).permit(:email,:password, :password_confirmation)
    end
    def log_in_redirect
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end
end
