class MaterialProvasController < ApplicationController
  # GET /material_provas
  # GET /material_provas.json
  def index
    @material_provas = MaterialProva.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_provas }
    end
  end

  # GET /material_provas/1
  # GET /material_provas/1.json
  def show
    @material_prova = MaterialProva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_prova }
    end
  end

  # GET /material_provas/new
  # GET /material_provas/new.json
  def new
    @material_prova = MaterialProva.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_prova }
    end
  end

  # GET /material_provas/1/edit
  def edit
    @material_prova = MaterialProva.find(params[:id])
  end

  # POST /material_provas
  # POST /material_provas.json
  def create
    @material_prova = MaterialProva.new(params[:material_prova])

    respond_to do |format|
      if @material_prova.save
        format.html { redirect_to @material_prova, notice: 'Requisicao publicada com sucesso.' }
        format.json { render json: @material_prova, status: :created, location: @material_prova }
      else
        format.html { render action: "new" }
        format.json { render json: @material_prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_provas/1
  # PUT /material_provas/1.json
  def update
    @material_prova = MaterialProva.find(params[:id])

    respond_to do |format|
      if @material_prova.update_attributes(params[:material_prova])
        format.html { redirect_to @material_prova, notice: 'Requisicao alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_prova.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @material_prova = MaterialProva.find(params[:id])
  end

  # DELETE /material_provas/1
  # DELETE /material_provas/1.json
  def destroy
    @material_prova = MaterialProva.find(params[:id])
    @material_prova.destroy

    respond_to do |format|
      format.html { redirect_to material_provas_url }
      format.json { head :no_content }
    end
  end
end
