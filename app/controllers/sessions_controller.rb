class SessionsController < ApplicationController
  def home
  end
  
  def new
  end
  
  def create
      #byebug
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      elsif user.blank?
        flash[:message] = "Please fill all fields"
      else
        flash[:message] = "Incorrect login info"
        render :new
      end
  end

  def github
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.username = auth["info"]["nickname"]
        user.password = SecuredRandom.hex(10)
    end
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        render :new
    end
end

  def destroy
      if current_user
          session.delete :user_id
          redirect_to root_url
      end
  end

  def auth
    request.env['omniauth.auth']
  end

end
