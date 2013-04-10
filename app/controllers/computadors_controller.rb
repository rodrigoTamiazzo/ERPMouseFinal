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
    @valor = Computador.all.size
    @url = "http://chart.apis.google.com/chart?chxt=x,y&cht=bvs&chd=t:#{@valor},70,85,65,40&chco=76A4FB&chls=2.0&chs=380x150&chxl=0:|Jan|FF|Fev|Mar|Abr|Mai"
    

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
   #  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
   #  puts ram1.to_s
   #  puts @string1
   #  puts @string2
   #  @url2 = "http://chart.apis.google.com/chart?cht=lc&chs=300x200&chd=t:#{stringy}&chxt=x,y&chxl=0:#{stringx}"
    @url3 = "http://chart.apis.google.com/chart?cht=pc&chs=300x200&chd=t:#{@string1}&chxt=x&chxl=0:#{@string2}"
  
  end

  def etiqueta
    @computador = Computador.find(params[:id])
  end
end
