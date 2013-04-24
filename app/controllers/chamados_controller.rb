#encoding: utf-8 
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
  
  def relatorioMeses
    @@relatorio = 'Relátorio de Chamados'
    chamados = Chamado.all
    jan = 0
    fev = 0
    abril = 0
    maio = 0
    junho = 0
    julho = 0
    chamados.each do |chamado|
      if chamado.data_de_abertura.to_date  1  
        jan += 1 
      elsif chamado.cpu.to_i == 2 
        fev += 1  
      elsif chamado.cpu.to_i == 3 
        abril += 1
      elsif chamado.cpu.to_i == 4 
        maio += 1
      elsif chamado.cpu.to_i == 6 
        junho += 1
      elsif chamado.cpu.to_i == 8 
        julho += 1
      end
    end
    jan = (jan * 100)/chamadoes.size
    fev = (fev * 100)/chamadoes.size
    abril = (abril * 100)/chamadoes.size
    maio = (maio * 100)/chamadoes.size
    junho = (junho * 100)/chamadoes.size
    julho = (julho * 100)/chamadoes.size
    @string1 = jan.to_s + ',0,' + fev.to_s + ',0,' + abril.to_s+ ',0,' + maio.to_s+ ',0,' + junho.to_s + ',0,' + julho.to_s
    @string2 = "|Jan||Fev||Abril||Maio||Jun||Jul|"
    @@url = "http://chart.apis.google.com/chart?cht=bvg&chs=300x200&chd=t:#{@string1}&chxt=x,y&chxl=0:#{@string2}1:|0|#{chamadoes.size.to_f/2}|#{chamadoes.size}"
    redirect_to "/chamados/relatorio"
  end

  def relatorioPrioridade
    @@relatorio = 'Relátorio de Prioriade dos Chamados'
    chamados = Chamado.all
    baixa = 0
    media = 0
    alta = 0
    chamados.each do |chamado|
      if chamado.prioridade == "Baixa"  
        baixa += 1 
      elsif chamado.prioridade == "Média" 
        media += 1  
      elsif chamado.prioridade == "Alta" 
        alta += 1
      end
    end
    baixa = (baixa * 100)/chamados.size
    media = (media * 100)/chamados.size
    alta = (alta * 100)/chamados.size
    @string1 = baixa.to_s + ',0,' + media.to_s + ',0,' + alta.to_s
    @string2 = "|Baixa||Média||Alta|"
    @@url = "http://chart.apis.google.com/chart?cht=bvg&chs=300x200&chd=t:#{@string1}&chxt=x,y&chxl=0:#{@string2}1:|0|#{chamados.size.to_f/2}|#{chamados.size}"
    redirect_to "/chamados/relatorio"
  end

  def relatorio
    @rel = @@relatorio
    @url = @@url
  end
end
