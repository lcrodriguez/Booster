class SpecialitiesController < ApplicationController
  # GET /specialities
  # GET /specialities.xml
  def index
    @specialities = Speciality.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialities }
      format.xls # standard
    end
  end

  # GET /specialities/1
  # GET /specialities/1.xml
  def show
    @speciality = Speciality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @speciality }
    end
  end

  # GET /specialities/new
  # GET /specialities/new.xml
  def new
    @speciality = Speciality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @speciality }
    end
  end

  # GET /specialities/1/edit
  def edit
    @speciality = Speciality.find(params[:id])
  end

  # POST /specialities
  # POST /specialities.xml
  def create
    @speciality = Speciality.new(params[:speciality])

    respond_to do |format|
      if @speciality.save
        format.html { redirect_to(@speciality, :notice =>  t('record_created')) }
        format.xml  { render :xml => @speciality, :status => :created, :location => @speciality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @speciality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specialities/1
  # PUT /specialities/1.xml
  def update
    @speciality = Speciality.find(params[:id])

    respond_to do |format|
      if @speciality.update_attributes(params[:speciality])
        format.html { redirect_to(@speciality, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @speciality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specialities/1
  # DELETE /specialities/1.xml
  def destroy
    @speciality = Speciality.find(params[:id])
    @speciality.destroy

    respond_to do |format|
      format.html { redirect_to(specialities_url) }
      format.xml  { head :ok }
    end
  end
end
