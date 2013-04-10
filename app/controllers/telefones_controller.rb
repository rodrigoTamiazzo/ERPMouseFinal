class TelefonesController < ApplicationController
  load_and_authorize_resource
  
  # GET /telefones
  # GET /telefones.json
  def index
    @telefones = Telefone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @telefones }
    end
  end

  # GET /telefones/1
  # GET /telefones/1.json
  def show
    @telefone = Telefone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @telefone }
    end
  end

  # GET /telefones/new
  # GET /telefones/new.json
  def new
    @telefone = Telefone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @telefone }
    end
  end

  # GET /telefones/1/edit
  def edit
    @telefone = Telefone.find(params[:id])
  end

  # POST /telefones
  # POST /telefones.json
  def create
    @telefone = Telefone.new(params[:telefone])

    respond_to do |format|
      if @telefone.save
        format.html { redirect_to @telefone, :notice => 'Telefone foi salvo com sucesso.' }
        format.json { render :json => @telefone, :status => :created, :location => @telefone }
      else
        format.html { render :action => "new" }
        format.json { render :json => @telefone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /telefones/1
  # PUT /telefones/1.json
  def update
    @telefone = Telefone.find(params[:id])

    respond_to do |format|
      if @telefone.update_attributes(params[:telefone])
        format.html { redirect_to @telefone, :notice => 'Telefone foi salvo com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @telefone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /telefones/1
  # DELETE /telefones/1.json
  def destroy
    @telefone = Telefone.find(params[:id])
    @telefone.destroy

    respond_to do |format|
      format.html { redirect_to telefones_url }
      format.json { head :no_content }
    end
  end

  def relatorio
    @valor = Telefone.all.size
    @url = "http://chart.apis.google.com/chart?chxt=x,y&cht=bvs&chd=t:#{@valor},70,85,65,40&chco=76A4FB&chls=2.0&chs=380x150&chxl=0:|Jan|FF|Fev|Mar|Abr|Mai"
  end

  def etiqueta
    @telefone = Telefone.find(params[:id])
  end
end
