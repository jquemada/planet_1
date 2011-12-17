class ViajesController < ApplicationController
  # GET /viajes
  # GET /viajes.json
  def index
    @viajes = Viaje.find(:all, :order =>"orden")
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
#if params[:site_id]!=nil #si site_id no es nil ... 
@orden_new = params[:viaje][:orden]    
@orden_old = params[:viaje][:orden_old]
    @viaje_old = Viaje.find_by_orden(@orden_new)
    @viaje = Viaje.find(params[:id]) #al que modifico pongo orden que me envian y al viaje_old le pongo el orden del actual
    
    respond_to do |format|
  if (@viaje.update_attributes(:orden => @orden_new) and @viaje_old.update_attributes(:orden => @orden_old))
 #      if @viaje.update_attributes(params[:viaje])
        format.html { redirect_to @viaje, notice: 'Viaje was successfully updated. Order Changed--> ' + 'new order: '+@orden_new.to_s}
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
    @orden = @viaje.orden  #al borrar hay que reordenar los sitios del viaje
@resto_sitios = Viaje.where("orden > ?", @orden)
@viaje.destroy

@resto_sitios.each do |viaje|
 
viaje.update_attributes(:orden => @orden)
@orden = @orden+1
end
    respond_to do |format|
      format.html { redirect_to viajes_url }
      format.json { head :ok }
    end
  end
end
