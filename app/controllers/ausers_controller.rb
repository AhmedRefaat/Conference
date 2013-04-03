class AusersController < ApplicationController
          def photoselecter
    @num = rand(15) +1
    @photo  = "cairo"
    return @photo
  end
  # GET /ausers
  # GET /ausers.json
  def index
    @photo = self.photoselecter
    if ((session[:user_id] != nil) and (User.find(session[:user_id]).admin))
    @ausers = Auser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ausers }
    end
    else 
      respond_to do |format|
      format.html { redirect_to conf_home_path, notice: "Sorry you are not authorized to Access this Page" }
    end
    end
  end

  # GET /ausers/1
  # GET /ausers/1.json
  def show
    @photo = self.photoselecter
    if (session[:user_id] != nil)
      @current_user = User.find(session[:user_id])
    end
    if ((session[:user_id] != nil) and ((User.find(session[:user_id]).admin)))
    @auser = Auser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auser }
    end
    else 
       respond_to do |format|
      format.html { redirect_to conf_home_path, notice: "Sorry you are not authorized to Access this Page" }
    end
    end
      
  end

  # GET /ausers/new
  # GET /ausers/new.json
  def new
    @photo = self.photoselecter
    @auser = Auser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auser }
    end
  end

  # GET /ausers/1/edit
  def edit
    @photo = self.photoselecter
    if ((session[:user_id] != nil) and (User.find(session[:user_id]).admin))
    @auser = Auser.find(params[:id])
    else 
      respond_to do |format|
      format.html { redirect_to conf_home_path, notice: "Sorry you are not authorized to Access this Page" }
    end
    end
  end

  # POST /ausers
  # POST /ausers.json
  def create
    @photo = self.photoselecter
    @auser = Auser.new(params[:auser])

    respond_to do |format|
      if @auser.save
      session[:auser_id] = @auser.id
       format.html { redirect_to new_user_path, notice: "User #{@auser.username} was successfully created." }
        format.json { render json: @auser, status: :created, location: @auser }
      else
        format.html { render action: "new" }
        format.json { render json: @auser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ausers/1
  # PUT /ausers/1.json
  def update
    @photo = self.photoselecter
    @auser = Auser.find(params[:id])
    

    respond_to do |format|
      if @auser.update_attributes(params[:auser])
        format.html { redirect_to @auser, notice: 'Auser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ausers/1
  # DELETE /ausers/1.json
  def destroy
    @photo = self.photoselecter
    if ((session[:user_id] != nil) and (User.find(session[:user_id]).admin))
    @auser = Auser.find(params[:id])
    @auser.destroy

    respond_to do |format|
      format.html { redirect_to ausers_url }
      format.json { head :no_content }
    end
     else 
      respond_to do |format|
      format.html { redirect_to conf_home_path, notice: "Sorry you are not authorized to Access this Page" }
    end
  end
end
end

