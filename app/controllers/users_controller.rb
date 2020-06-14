class UsersController < ApplicationController
    def new 
        @user = User.new
    end 
    
    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id 
        if session[:user_id] == nil 
            redirect_to new_user_path
        else
        redirect_to user_path(@user)
        end
    end 

    def show 
        @user = User.find(params[:id])
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end
