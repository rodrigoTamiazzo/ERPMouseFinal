#encoding: utf-8 
class LicencaDeSoftwaresController < ApplicationController
 load_and_authorize_resource
 
  # GET /licenca_de_softwares
  # GET /licenca_de_softwares.json
  def index
    @licenca_de_softwares = LicencaDeSoftware.all.sort { |a,b| a.data_de_expiracao <=> b.data_de_expiracao }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @licenca_de_softwares }
    end
  end

  # GET /licenca_de_softwares/1
  # GET /licenca_de_softwares/1.json
  def show
    @licenca_de_software = LicencaDeSoftware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @licenca_de_software }
    end
  end

  # GET /licenca_de_softwares/new
  # GET /licenca_de_softwares/new.json
  def new
    @licenca_de_software = LicencaDeSoftware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @licenca_de_software }
    end
  end

  # GET /licenca_de_softwares/1/edit
  def edit
    @licenca_de_software = LicencaDeSoftware.find(params[:id])
  end

  # POST /licenca_de_softwares
  # POST /licenca_de_softwares.json
  def create
    @licenca_de_software = LicencaDeSoftware.new(params[:licenca_de_software])

    respond_to do |format|
      if @licenca_de_software.save
        format.html { redirect_to @licenca_de_software, notice: 'Licença foi salva com sucesso.' }
        format.json { render json: @licenca_de_software, status: :created, location: @licenca_de_software }
      else
        format.html { render action: "new" }
        format.json { render json: @licenca_de_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /licenca_de_softwares/1
  # PUT /licenca_de_softwares/1.json
  def update
    @licenca_de_software = LicencaDeSoftware.find(params[:id])

    respond_to do |format|
      if @licenca_de_software.update_attributes(params[:licenca_de_software])
        format.html { redirect_to @licenca_de_software, notice: 'Licença foi salva com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @licenca_de_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenca_de_softwares/1
  # DELETE /licenca_de_softwares/1.json
  def destroy
    @licenca_de_software = LicencaDeSoftware.find(params[:id])
    @licenca_de_software.destroy

    respond_to do |format|
      format.html { redirect_to licenca_de_softwares_url }
      format.json { head :no_content }
    end
  end

  def relatorio
    @valor = LicencaDeSoftware.all.size
    @url = "http://chart.apis.google.com/chart?chxt=x,y&cht=bvs&chd=t:#{@valor},70,85,65,40&chco=76A4FB&chls=2.0&chs=380x150&chxl=0:|Jan|FF|Fev|Mar|Abr|Mai"
  end
  def etiqueta
    @licenca_de_software  = LicencaDeSoftware.find(params[:id])
  end
end
