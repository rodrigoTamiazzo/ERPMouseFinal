class ChamadosController < ApplicationController
  load_and_authorize_resource
  
  # GET /chamados
  # GET /chamados.json
  def index
    @chamados = Chamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @chamados }
    end
  end

  #GET /chamados/lista_respostas_chamado
  def lista_respostas_chamado
    @chamado = Chamado.find(params[:id]) 
  end

  # GET /chamados/1
  # GET /chamados/1.json
  def show
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @chamado }
    end
  end

  # GET /chamados/new
  # GET /chamados/new.json
  def new
    @chamado = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @chamado }
    end
  end

  # GET /chamados/responder
  def responder
    @chamados = Chamado.all
  end
    # GRT /chamdos/resposta
  def resposta
    #@chamado = Chamado.find(params[:id])
    redirect_to(resposta_path)
  end
  # GET /chamados/1/edit
  def edit
    @chamado = Chamado.find(params[:id])
  end

  # POST /chamados
  # POST /chamados.json
  def create
    @chamado = Chamado.new(params[:chamado])

    respond_to do |format|
      if @chamado.save
        format.html { redirect_to @chamado, :notice => 'Chamado foi salvo com sucesso.' }
        format.json { render :json => @chamado, :status => :created, :location => @chamado }
      else
        format.html { render :action => "new" }
        format.json { render :json => @chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.json
  def update
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      if @chamado.update_attributes(params[:chamado])
        format.html { redirect_to @chamado, :notice => 'Chamado foi salvo com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.json
  def destroy
    @chamado = Chamado.find(params[:id])
    @chamado.destroy

    respond_to do |format|
      format.html { redirect_to chamados_url }
      format.json { head :no_content }
    end
  end
  # GET /relatorio
  # GET /realtorio.json
  def relatorio
    chamados = Chamado.all
    chamados2 = Chamado.where([:prioridade = ?, "alta"])
    chamados2.each do
    @url = "http://chart.apis.google.com/chart?cht=bvgc&chs=300x200&chd=t:#{stringy}&chxt=x,y&chxl=0:#{stringx}"
    
  end
end
