

class ConfController < ApplicationController
  def photoselecter

    @num = rand(15) +1
    @photo  = "cairo"
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
    #closing the submission becasue of the deadline, then the submission page will leads u to the home page
    #redirect_to conf_home_path
    
    @photo = self.photoselecter
    @new_submit = 1 
    #@paper1 = Paper.new
    if session[:user_id]
      @paper = Paper.find_by_user_id(session[:user_id])
      if @paper.nil?
          @new_submit = 0   
       # redirect_to new_paper_path
      end
      @papers = [@paper]
    else
      redirect_to login_url
    end
    
  end
  def  Committees

    @photo = self.photoselecter
  end

  def about

    #@photo = self.photoselecter
    @num = rand(11) +1
    @photo  = "dep"
  end
  def venue

    @num = rand(9) +1
    @photo  = "hotel"
    #@photo = self.photoselecter
  end
  def program
    @photo1  = "Page000"
    @photo = self.photoselecter
  end
end
