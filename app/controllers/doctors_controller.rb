class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.xml
  def index
    @states = State.all.collect { |c| [c.name, c.id] }
    add_default(@states)

    @cities = City.all.collect { |c| [c.name, c.id] }
    add_default(@cities)

    @specialities = Speciality.all.collect { |c| [c.name, c.id] }
    add_default(@specialities)
    
    @doctors = Doctor.search(params)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctors }
      format.xls # standard
    end
  end
  
  # GET /doctors/1
  # GET /doctors/1.xml
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor }
      format.json  { render :json => @doctor }
    end
  end
  
  # GET /doctors/get_address/1.json
  def get_address
    @doctor = Doctor.find(params[:id])
    address = @doctor.search_address;

    respond_to do |format|
      format.json  { render :json => address }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.xml
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.xml
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to(@doctor, :notice => t('record_created')) }
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.xml
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to(@doctor, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.xml
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to(doctors_url) }
      format.xml  { head :ok }
    end
  end

  def import
  end

  def uploadFile
    post = Doctor.import(params[:upload])
    flash[:ok] = t("imported")
    redirect_to '/doctors/'
  end

end
