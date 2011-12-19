class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip]) 

	if !Trip.find(:last, :order => 'trip_id').nil?
		@trip.trip_id = Trip.find(:last, :order => 'trip_id').trip_id + 1
	end
	
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])
    # tid1 identificador de posicion viejo
    tid1 = @trip.trip_id

    respond_to do |format|
      if @trip.update_attributes(params[:trip])

	@trips = Trip.find(:all, :order => 'trip_id')

	@trips.each do |trip|
	  # Si la posicion nueva esta por encima de la vieja, baja los que estuvieran entre ellas
	  if @trip.trip_id < tid1
		if (trip.trip_id < tid1) && (trip.trip_id >= @trip.trip_id) && (trip.site_id != @trip.site_id)
		 	 trip.trip_id = trip.trip_id + 1
		 	 trip.save
		 end
	  end
	  # Si la posicion nueva esta por debajo de la vieja, sube los que estuvieran entre ellas
	  if @trip.trip_id > tid1
		 if (trip.trip_id > tid1) && (trip.trip_id <= @trip.trip_id) && (trip.site_id != @trip.site_id)
		   trip.trip_id = trip.trip_id - 1
		   trip.save
		 end
	   end
	end

        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
   	@trip = Trip.find(params[:id])
	# tid es la posicion borrada
   	tid = @trip.trip_id
   	@trip.destroy
   	@trips = Trip.find(:all, :order => 'trip_id')

   	@trips.each do |trip|
 		if trip.trip_id > tid
			trip.trip_id = trip.trip_id - 1
			trip.save
		end
	end

	respond_to do |format|
		format.html { redirect_to trips_url }
		format.json { head :ok }
	end
  end
end
