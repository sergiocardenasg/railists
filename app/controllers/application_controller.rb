class ApplicationController < ActionController::Base
    before_action :logged_in?
    helper_method :current_user, :logged_in?

    def logged_in? 
        !!session[:user_id]
    end 

    private 
    
    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
end
