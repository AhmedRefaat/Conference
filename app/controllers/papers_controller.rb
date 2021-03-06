class PapersController < ApplicationController
  
    def photoselecter
    @num = rand(15) +1
    @photo  = "cairo"
    return @photo
  end
  # GET /papers
  # GET /papers.json
  def index
    @papers = []
    @photo = self.photoselecter
    if ((session[:user_id] != nil) and ((User.find(session[:user_id]).admin) or (User.find(session[:user_id]).officer)))
      ##############################################################################
      #this is a register user 
      ##############################################################################
            #this is an authorized user
                @papers = Paper.all
               # @papers = [@paper]
        
              respond_to do |format|
                  format.html # index.html.erb
                  format.json { render json: @papers }
              end
          else
            #@paper = Paper.find_by_user_id(session[:user_id])
              #respond_to do |format|
              #format.html # index.html.erb
              #format.json { render json: @papers }
            #end
            respond_to do |format|
                 format.html {redirect_to conf_home_path, notice: "Sorry! you aren't Authorized to access this page"}
            end  
          end
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @photo = self.photoselecter
    @paper = Paper.find(params[:id])
    if ((session[:user_id] != nil) and ((User.find(session[:user_id]).admin) or (User.find(session[:user_id]).officer) or (@paper.user_id == session[:user_id])))
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paper }
    end
    else 
        respond_to do |format|
                 format.html {redirect_to conf_home_path, notice: "Sorry! you aren't Authorized to access this page"}
            end  
          end
  end

  # GET /papers/new
  # GET /papers/new.json
  def new
    @photo = self.photoselecter
    redirect_to conf_home_path
    #if (session[:user_id])
    #@paper = Paper.new

    #respond_to do |format|
     # format.html # new.html.erb
      #format.json { render json: @paper }
    #end
    #else
     #  respond_to do |format|
     # format.html {redirect_to conf_home_path, notice: "Sorry! you have to login first"}
    #end
    #end
  end

  # GET /papers/1/edit
  def edit
    @photo = self.photoselecter
    if ((session[:user_id] != nil) and ((User.find(session[:user_id]).admin) or (@paper.user_id == session[:user_id])))
    @paper = Paper.find(params[:id])
    else 
         respond_to do |format|
      format.html {redirect_to conf_home_path, notice: "Sorry! you don't have privilege to edit this Abstract"}
    end
    end
    
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(params[:paper])
    if (session[:user_id])
    @paper.user_id = session[:user_id]

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render json: @paper, status: :created, location: @paper }
      else
        format.html { render action: "new" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
    else
         respond_to do |format|
      format.html {redirect_to conf_home_path, notice: "Sorry! you have to login first"}
    end
  end

  # PUT /papers/1
  # PUT /papers/1.json
  def update
    @photo = self.photoselecter
    @paper = Paper.find(params[:id])
    @paper.user_id = session[:user_id]

    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    if ((session[:user_id] != nil) and (User.find(session[:user_id]).admin) )
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to papers_url }
      format.json { head :no_content }
    end
    else 
          respond_to do |format|
      format.html {redirect_to conf_home_path, notice: "Sorry! you have the privilage to access this page"}
    end      
  end
end
end
end
