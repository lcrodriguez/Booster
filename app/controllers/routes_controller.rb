class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.xml
  def index
    @users = User.all.collect { |c| [c.username, c.id] }
    add_default(@users)
    
    @start_date = nil
    if params[:start_date].present? && params[:start_date][:year] != "" && params[:start_date][:month] != "" && params[:start_date][:day] != ""
      @start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i) 
    end  
    
    @routes = Route.search(params)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @routes }
      format.xls # standard
    end
  end

  # GET /routes/1
  # GET /routes/1.xml
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.xml
  def new
    @route = Route.new
    
    10.times do 
      @route.route_lines.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
    
    10.times do 
      @route.route_lines.build
    end  
  end

  # POST /routes
  # POST /routes.xml
  def create
    @route = Route.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to(@route, :notice =>  t('record_created')) }
        format.xml  { render :xml => @route, :status => :created, :location => @route }
      else
        10.times do 
          @route.route_lines.build
        end
        
        format.html { render :action => "new" }
        format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.xml
  def update
    @route = Route.find(params[:id])
    
    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to(@route, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        10.times do 
          @route.route_lines.build
        end
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.xml
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to(routes_url) }
      format.xml  { head :ok }
    end
  end
end
