class InstitutionsController < ApplicationController
  def types
    @types = [ "Estatal", "Hosp. Privado", "Clinica Privada" ]
  end
  
  # GET /institutions
  # GET /institutions.xml
  def index
    @states = State.all.collect { |c| [c.name, c.id] }
    add_default(@states)

    @cities = City.all.collect { |c| [c.name, c.id] }
    add_default(@cities)

    @institutions = Institution.search(params)    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institutions }
      format.xls # standard
    end
  end

  # GET /institutions/1
  # GET /institutions/1.xml
  def show
    @institution = Institution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institution }
    end
  end

  # GET /institutions/new
  # GET /institutions/new.xml
  def new
    @institution = Institution.new
    @types = types

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @institution }
    end
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id])
    @types = types
  end

  # POST /institutions
  # POST /institutions.xml
  def create
    @institution = Institution.new(params[:institution])
    @types = types

    respond_to do |format|
      if @institution.save
        format.html { redirect_to(@institution, :notice =>  t('record_created')) }
        format.xml  { render :xml => @institution, :status => :created, :location => @institution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institutions/1
  # PUT /institutions/1.xml
  def update
    @institution = Institution.find(params[:id])

    respond_to do |format|
      if @institution.update_attributes(params[:institution])
        format.html { redirect_to(@institution, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.xml
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to(institutions_url) }
      format.xml  { head :ok }
    end
  end
end
