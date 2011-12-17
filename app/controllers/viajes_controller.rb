class ViajesController < ApplicationController
  # GET /viajes
  # GET /viajes.json
  def index
    @viajes = Viaje.all
    @sitios = Site.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @viajes }
    end
  end

  # GET /viajes/1
  # GET /viajes/1.json
  def show
    @viaje = Viaje.find(params[:id])
    @sitio = Site.find(@viaje.site_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @viaje }
    end
  end

  # GET /viajes/new
  # GET /viajes/new.json
  def new
    @viaje = Viaje.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @viaje }
    end
  end

  # GET /viajes/1/edit
  def edit
    @viaje = Viaje.find(params[:id])
  end

  

# POST /viajes
  # POST /viajes.json


  def create
 @orden_sig = (Viaje.all.count+1)
if params[:site_id].nil? 
    @viaje = Viaje.new(params[:viaje])
else 
if params[:orden]==@orden_sig 
   @viaje = Viaje.new(params[:viaje])
else
  params[:orden]= @orden_sig 
@viaje = Viaje.new(params[:viaje])
 # @viaje = Viaje.new(:site_id =>params[:viaje][:site_id], :orden => (Viaje.all.count+1))
end
end
    respond_to do |format|
      if @viaje.save
        format.html { redirect_to @viaje, notice: 'Viaje was successfully created. Order: '+ @orden_sig.to_s }
        format.json { render json: @viaje, status: :created, location: @viaje }
      else
        format.html { render action: "new" }
        format.json { render json: @viaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /viajes/1
  # PUT /viajes/1.json
  def update
    @viaje = Viaje.find(params[:id])

    respond_to do |format|
      if @viaje.update_attributes(params[:viaje])
        format.html { redirect_to @viaje, notice: 'Viaje was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @viaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viajes/1
  # DELETE /viajes/1.json
  def destroy
    @viaje = Viaje.find(params[:id])
    @viaje.destroy

    respond_to do |format|
      format.html { redirect_to viajes_url }
      format.json { head :ok }
    end
  end
end
