class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
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
        @user = User.find(params[:id])
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
