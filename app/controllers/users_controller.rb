class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
      end
      def show
        
      end
  
      def edit
        #byebug
      end
      def update        
          if @user.update(user_params)
              #byebug
              #OrderMailer.with(order: @order).new_order_email.deliver_later
              flash[:notice] = "Your user was successfully updated"
              redirect_to @user
          else
              render 'edit'
          end
      end
      def destroy
        #OrderMailer.with(order: @order).delete_order_email.deliver_later
        @user.destroy
        session[:user_id] = nil #if @user == current_user
        flash[:notice] = "User successfully deleted"
        redirect_to root_path
    end
  
    
      private
      def user_params
        params.require(:user).permit(:email, :password_digest, :header_image)
      end
      def set_user 
        @user = User.find(params[:id])
      end
      def require_same_user
        if current_user != @user #&& !current_user.admin?
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to users_path
        end
    end



end

