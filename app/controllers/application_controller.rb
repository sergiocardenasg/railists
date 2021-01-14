class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        @user = User.find_by(id: session[:user_id])
    end 

    def logged_in?
        redirect_to '/signin' unless current_user
    end
end
