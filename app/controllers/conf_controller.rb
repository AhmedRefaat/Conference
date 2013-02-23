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
    @paper1 = Paper.new
    if session[:user_id]
      @paper = Paper.find_by_user_id(session[:user_id])
      if @paper.nil?
        redirect_to new_paper_path
      end
      @papers = [@paper]
    else
      redirect_to login_url
    end
  end

  def about
    @photo = self.photoselecter
  end
end
