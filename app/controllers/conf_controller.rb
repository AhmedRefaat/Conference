class ConfController < ApplicationController
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
    @paper1 = Paper.new
    if session[:user_id]
    @paper = Paper.find_by_user_id(session[:user_id])
    @papers = [@paper]
    #@papers = @papers + [@paper1]
     @cc = [1,2,34,5]
     p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
     p @paper1
    else
      redirect_to login_url
    end
  end
  def  Committees
    @photo = self.photoselecter
  end

  def about
    @photo = self.photoselecter
  end
end
