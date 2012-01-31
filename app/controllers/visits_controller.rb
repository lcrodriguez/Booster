class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.xml
  def index
    @requests = Request.all.collect { |c| [c.name, c.id] }
    add_default(@requests)

    @visiton = nil
    if params[:visiton].present? && params[:visiton][:year] != "" && params[:visiton][:month] != "" && params[:visiton][:day] != ""
      @visiton = Date.civil(params[:visiton][:year].to_i, params[:visiton][:month].to_i, params[:visiton][:day].to_i) 
    end  
    
    @visits = Visit.search(params)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
      format.xls # standard
    end
  end
  
  def autocomplete_doctor_full_name
    doctors = Doctor.find_autocomplete(params)
    render :json => json_for_autocomplete(doctors, "full_name")
  end

  # GET /visits/1
  # GET /visits/1.xml
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.xml
  def new
    if params[:request].present?
      @visit = Visit.new 
      @visit.request = Request.find_by_id(params[:request])
      @visit.request.request_items.each do |item|
        @visit.visitdetails.build(:material => item.material, :quantityrequested => item.quantity)
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
    @visit.docname = @visit.doctor.full_name
  end

  # POST /visits
  # POST /visits.xml
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to(@visit, :notice => t('record_created')) }
        format.xml  { render :xml => @visit, :status => :created, :location => @visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.xml
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to(@visit, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.xml
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to(visits_url) }
      format.xml  { head :ok }
    end
  end
end
