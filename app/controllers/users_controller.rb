class UsersController < ApplicationController
        def photoselecter
    @num = rand(15) +1
    @photo  = "cairo"+@num.to_s+".jpg"
    return @photo
  end
  # GET /users
  # GET /users.json
  def index
    @photo = self.photoselecter
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @photo = self.photoselecter
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @photo = self.photoselecter
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @photo = self.photoselecter
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @photo = self.photoselecter
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.html { redirect_to conf_home_url, notice: "User #{@user.username} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @photo = self.photoselecter
    @user = User.find(params[:id])
    if (params[:user_status] = "admin")
      
    end
    @user.user_status = params[:user_status]

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.html { redirect_to conf_home_url, notice: "User #{@user.username} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @paper = Paper.find_by_user_id (params[:id])
    @paper.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def admin_edit
    @user = User.find(4)
    @priv = ["admin", "moderator", "conference_member"]
  end
end
