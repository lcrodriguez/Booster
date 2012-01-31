class RouteLinesController < ApplicationController
  # GET /route_lines
  # GET /route_lines.xml
  def index
    @route_lines = RouteLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @route_lines }
    end
  end

  # GET /route_lines/1
  # GET /route_lines/1.xml
  def show
    @route_line = RouteLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route_line }
    end
  end

  # GET /route_lines/new
  # GET /route_lines/new.xml
  def new
    @route_line = RouteLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route_line }
    end
  end

  # GET /route_lines/1/edit
  def edit
    @route_line = RouteLine.find(params[:id])
  end

  # POST /route_lines
  # POST /route_lines.xml
  def create
    @route_line = RouteLine.new(params[:route_line])

    respond_to do |format|
      if @route_line.save
        format.html { redirect_to(@route_line, :notice =>  t('record_created')) }
        format.xml  { render :xml => @route_line, :status => :created, :location => @route_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @route_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /route_lines/1
  # PUT /route_lines/1.xml
  def update
    @route_line = RouteLine.find(params[:id])

    respond_to do |format|
      if @route_line.update_attributes(params[:route_line])
        format.html { redirect_to(@route_line, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /route_lines/1
  # DELETE /route_lines/1.xml
  def destroy
    @route_line = RouteLine.find(params[:id])
    @route_line.destroy

    respond_to do |format|
      format.html { redirect_to(route_lines_url) }
      format.xml  { head :ok }
    end
  end
end
