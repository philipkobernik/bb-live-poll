class KittiesController < ApplicationController
  # GET /kitties
  # GET /kitties.json
  def index
    @kitties = Kitty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kitties }
    end
  end

  # GET /kitties/1
  # GET /kitties/1.json
  def show
    @kitty = Kitty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kitty }
    end
  end

  # GET /kitties/new
  # GET /kitties/new.json
  def new
    @kitty = Kitty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kitty }
    end
  end

  # GET /kitties/1/edit
  def edit
    @kitty = Kitty.find(params[:id])
  end

  # POST /kitties
  # POST /kitties.json
  def create
    @kitty = Kitty.new(params[:kitty])

    respond_to do |format|
      if @kitty.save
        format.html { redirect_to @kitty, notice: 'Kitty was successfully created.' }
        format.json { render json: @kitty, status: :created, location: @kitty }
      else
        format.html { render action: "new" }
        format.json { render json: @kitty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kitties/1
  # PUT /kitties/1.json
  def update
    @kitty = Kitty.find(params[:id])

    respond_to do |format|
      if @kitty.update_attributes(params[:kitty])
        format.html { redirect_to @kitty, notice: 'Kitty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kitty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kitties/1
  # DELETE /kitties/1.json
  def destroy
    @kitty = Kitty.find(params[:id])
    @kitty.destroy

    respond_to do |format|
      format.html { redirect_to kitties_url }
      format.json { head :no_content }
    end
  end
end
