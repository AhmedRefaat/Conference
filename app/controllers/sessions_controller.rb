class SessionsController < ApplicationController
      def photoselecter
    @num = rand(15) +1
    @photo  = "cairo"+@num.to_s+".jpg"
    return @photo
  end
  def new
    @photo = self.photoselecter
  end

  def create
    @photo = self.photoselecter
    user = Auser.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to conf_home_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to conf_home_url, notice: "Logged out"
  end
end
