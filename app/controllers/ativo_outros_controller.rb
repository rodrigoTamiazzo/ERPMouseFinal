class AtivoOutrosController < ApplicationController
  load_and_authorize_resource
  
  # GET /ativo_outros
  # GET /ativo_outros.json
  def index
    @ativo_outros = AtivoOutro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ativo_outros }
    end
  end

  # GET /ativo_outros/1
  # GET /ativo_outros/1.json
  def show
    @ativo_outro = AtivoOutro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ativo_outro }
    end
  end

  # GET /ativo_outros/new
  # GET /ativo_outros/new.json
  def new
    @ativo_outro = AtivoOutro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ativo_outro }
    end
  end

  # GET /ativo_outros/1/edit
  def edit
    @ativo_outro = AtivoOutro.find(params[:id])
  end

  # POST /ativo_outros
  # POST /ativo_outros.json
  def create
    @ativo_outro = AtivoOutro.new(params[:ativo_outro])

    respond_to do |format|
      if @ativo_outro.save
        format.html { redirect_to @ativo_outro, notice: 'Ativo foi salvo com sucesso.' }
        format.json { render json: @ativo_outro, status: :created, location: @ativo_outro }
      else
        format.html { render action: "new" }
        format.json { render json: @ativo_outro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ativo_outros/1
  # PUT /ativo_outros/1.json
  def update
    @ativo_outro = AtivoOutro.find(params[:id])

    respond_to do |format|
      if @ativo_outro.update_attributes(params[:ativo_outro])
        format.html { redirect_to @ativo_outro, notice: 'Ativo foi salvo com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ativo_outro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ativo_outros/1
  # DELETE /ativo_outros/1.json
  def destroy
    @ativo_outro = AtivoOutro.find(params[:id])
    @ativo_outro.destroy

    respond_to do |format|
      format.html { redirect_to ativo_outros_url }
      format.json { head :no_content }
    end
  end

  def etiqueta
    @ativo_outro = AtivoOutro.find(params[:id])
  end

end
