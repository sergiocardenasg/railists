class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        if logged_in?
            redirect_to root_path
        else
            @user = User.new
        end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # byebug
            render :new
        end
    end

    def show
        if logged_in?
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
