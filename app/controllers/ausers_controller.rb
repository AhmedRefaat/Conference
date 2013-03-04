class AusersController < ApplicationController
    @@id = 3
  # GET /ausers
  # GET /ausers.json
  def index
    @ausers = Auser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ausers }
    end
  end

  # GET /ausers/1
  # GET /ausers/1.json
  def show
    @auser = Auser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auser }
    end
  end

  # GET /ausers/new
  # GET /ausers/new.json
  def new
    @auser = Auser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auser }
    end
  end

  # GET /ausers/1/edit
  def edit
    @auser = Auser.find(params[:id])
  end

  # POST /ausers
  # POST /ausers.json
  def create
    @auser = Auser.new(params[:auser])
    #@auser.id = @@id + 20
    @auser.id = 3
#    @@id = @@id +1

    respond_to do |format|
      if @auser.save
      session[:id] = @auser.id
        format.html { redirect_to @auser, notice: 'Auser was successfully created.' }
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
    @auser = Auser.find(params[:id])
    @auser.destroy

    respond_to do |format|
      format.html { redirect_to ausers_url }
      format.json { head :no_content }
    end
  end
end
