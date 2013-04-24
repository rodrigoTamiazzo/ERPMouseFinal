#encoding: utf-8 
class ComputadorsController < ApplicationController
 #before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /computadors
  # GET /computadors.json
  def index
    @computadors = Computador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @computadors }
    end
  end

   # GET /computadors/1
  # GET /computadors/1.json
  def show
    @computador = Computador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @computador }
      format.pdf do
        pdf = ComputadorPdf.new(@computador, view_context)
        send_data pdf.render, filename:
        "computador_#{@computador.created_at.strftime("%d/%m%%Y")}.pdf",
        type: "application/pdf"
      end
    end
  end

  # GET /computadors/new
  # GET /computadors/new.json
  def new
    @computador = Computador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @computador }
    end
  end

  # GET /computadors/1/edit
  def edit
    @computador = Computador.find(params[:id])
  end

  # POST /computadors
  # POST /computadors.json
  def create
    @computador = Computador.new(params[:computador])

    respond_to do |format|
      if @computador.save
        format.html { redirect_to @computador, :notice => 'Computador foi salvo com sucesso.' }
        format.json { render :json => @computador, :status => :created, :location => @computador }
      else
        format.html { render :action => "new" }
        format.json { render :json => @computador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /computadors/1
  # PUT /computadors/1.json
  def update
    @computador = Computador.find(params[:id])

    respond_to do |format|
      if @computador.update_attributes(params[:computador])
        format.html { redirect_to @computador, :notice => 'Computador foi salvo com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @computador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /computadors/1
  # DELETE /computadors/1.json
  def destroy
    @computador = Computador.find(params[:id])
    @computador.destroy

    respond_to do |format|
      format.html { redirect_to computadors_url }
      format.json { head :no_content }
    end
  end

  def relatorio
    @rel = @@relatorio
    @url = @@url
  end

  def relatorioMemoria
    @@relatorio = 'Relátorio de Memória'
    computadores = Computador.all
    ram1 = 0
    ram2 = 0
    ram3 = 0
    ram4 = 0
    ram6 = 0
    ram8 = 0
    computadores.each do |computador|
      if computador.memoria.to_i == 1  
        ram1 += 1 
      elsif computador.memoria.to_i == 2 
        ram2 += 1  
      elsif computador.memoria.to_i == 3 
        ram3 += 1
      elsif computador.memoria.to_i == 4 
        ram4 += 1
      elsif computador.memoria.to_i == 6 
        ram6 += 1
      elsif computador.memoria.to_i == 8 
        ram8 += 8  
      end
    end
    ram1 = (ram1 *100 )/ computadores.size
    ram2 = (ram2 *100 )/ computadores.size
    ram3 = (ram3 *100 )/ computadores.size
    ram4 = (ram4 *100 )/ computadores.size
    ram6 = (ram6 *100 )/ computadores.size
    ram8 = (ram8 *100 )/ computadores.size
    @string1 = ram1.to_s + ',' + ram2.to_s + ',' + ram3.to_s+ ',' + ram4.to_s+ ',' + ram6.to_s + ',' + ram8.to_s
    @string2 = "|1GB|2GB|3GB|4GB|6GB|8GB|"
    @@url = "http://chart.apis.google.com/chart?cht=pc&chs=300x200&chd=t:#{@string1}&chxt=x&chxl=0:#{@string2}"
    redirect_to "/computadors/relatorio"
  end

  def relatorioProcessadores
    @@relatorio = 'Relátorio de Processadores'
    computadores = Computador.all
    cpu1 = 0
    cpu2 = 0
    cpu3 = 0
    cpu4 = 0
    cpu6 = 0
    cpu8 = 0
    computadores.each do |computador|
      if computador.cpu.to_i == 1  
        cpu1 += 1 
      elsif computador.cpu.to_i == 2 
        cpu2 += 1  
      elsif computador.cpu.to_i == 3 
        cpu3 += 1
      elsif computador.cpu.to_i == 4 
        cpu4 += 1
      elsif computador.cpu.to_i == 6 
        cpu6 += 1
      elsif computador.cpu.to_i == 8 
        cpu8 += 1
      end
    end
    cpu1 = (cpu1 * 100)/computadores.size
    cpu2 = (cpu2 * 100)/computadores.size
    cpu3 = (cpu3 * 100)/computadores.size
    cpu4 = (cpu4 * 100)/computadores.size
    cpu6 = (cpu6 * 100)/computadores.size
    cpu8 = (cpu8 * 100)/computadores.size
    @string1 = cpu1.to_s + ',0,' + cpu2.to_s + ',0,' + cpu3.to_s+ ',0,' + cpu4.to_s+ ',0,' + cpu6.to_s + ',0,' + cpu8.to_s
    @string2 = "|1CORE||2CORE||3CORE||4CORE||6CORE||8CORE|"
    @@url = "http://chart.apis.google.com/chart?cht=bvg&chs=300x200&chd=t:#{@string1}&chxt=x,y&chxl=0:#{@string2}1:|0|#{computadores.size.to_f/2}|#{computadores.size}"
    redirect_to "/computadors/relatorio"
  end

  def etiqueta
    @computador = Computador.find(params[:id])
  end
end
