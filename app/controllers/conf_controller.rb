class ConfController < ApplicationController
  @@photo = ""
  def photoselecter
    @num = rand(15) +1
    @photo  = "cairo"+@num.to_s+".jpg"
    return @photo
  end
  def home
    
    @photo = self.photoselecter
    #@photo = "cairo"+@num.to_s+".jpg"
  end

  def register
    @photo = self.photoselecter
  end

  def contact
    @photo = self.photoselecter
  end

  def submit
    @photo = self.photoselecter
    if session[:user_id]
      @paper = Paper.new
      respond_to do |format|
      format.html # submit.html.erb
      format.json { render json: @paper }
    end
    else
      redirect_to login_url
    end
  end

  def about
    @photo = self.photoselecter
  end
end
