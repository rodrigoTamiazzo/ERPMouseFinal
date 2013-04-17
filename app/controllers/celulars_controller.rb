class CelularsController < ApplicationController
  load_and_authorize_resource
  # GET /celulars
  # GET /celulars.json
  def index
    @celulars = Celular.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @celulars }
    end
  end

  # GET /celulars/1
  # GET /celulars/1.json
  def show
    @celular = Celular.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @celular }
    end
  end

  # GET /celulars/new
  # GET /celulars/new.json
  def new
    @celular = Celular.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @celular }
    end
  end

  # GET /celulars/1/edit
  def edit
    @celular = Celular.find(params[:id])
  end

  # POST /celulars
  # POST /celulars.json
  def create
    @celular = Celular.new(params[:celular])

    respond_to do |format|
      if @celular.save
        format.html { redirect_to @celular, notice: 'Celular was successfully created.' }
        format.json { render json: @celular, status: :created, location: @celular }
      else
        format.html { render action: "new" }
        format.json { render json: @celular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /celulars/1
  # PUT /celulars/1.json
  def update
    @celular = Celular.find(params[:id])

    respond_to do |format|
      if @celular.update_attributes(params[:celular])
        format.html { redirect_to @celular, notice: 'Celular was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @celular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /celulars/1
  # DELETE /celulars/1.json
  def destroy
    @celular = Celular.find(params[:id])
    @celular.destroy

    respond_to do |format|
      format.html { redirect_to celulars_url }
      format.json { head :no_content }
    end
  end
end
