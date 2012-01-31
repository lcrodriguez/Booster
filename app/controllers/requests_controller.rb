class RequestsController < ApplicationController

  def status
    @status = [ "Abierto", "Aceptado", "Cerrado" ]
  end
  
  # GET /requests
  # GET /requests.xml
  def index
    @customers = Customer.all.collect { |c| [c.name, c.id] }
    add_default(@customers)

    @statuses = status
    add_default(@statuses)

    @requests = Request.search(params)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
      format.xls # standard
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new
    @request_status = status
    
    Material.all.each do |material|
      @request.request_items.build(:material => material)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @request_status = status
    
    Material.all.each do |material|
      idx = @request.request_items.index{|ri| ri.material.id == material.id }
	    @request.request_items.build(:material => material) if idx == nil
    end
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    @request_status = status
    
    respond_to do |format|
      if @request.save
        
        format.html { redirect_to(@request, :notice =>  t('record_created')) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else

        Material.all.each do |material|
          idx = @request.request_items.index{|ri| ri.material.id == material.id }
    	    @request.request_items.build(:material => material) if idx == nil
        end

        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])
    @request_status = status

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        Material.all.each do |material|
          idx = @request.request_items.index{|ri| ri.material.id == material.id }
    	    @request.request_items.build(:material => material) if idx == nil
        end
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end
end
