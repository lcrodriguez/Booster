class MaterialCategoriesController < ApplicationController
  # GET /material_categories
  # GET /material_categories.xml
  def index
    @material_categories = MaterialCategory.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @material_categories }
      format.xls # standard
    end
  end

  # GET /material_categories/1
  # GET /material_categories/1.xml
  def show
    @material_category = MaterialCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @material_category }
    end
  end

  # GET /material_categories/new
  # GET /material_categories/new.xml
  def new
    @material_category = MaterialCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @material_category }
    end
  end

  # GET /material_categories/1/edit
  def edit
    @material_category = MaterialCategory.find(params[:id])
  end

  # POST /material_categories
  # POST /material_categories.xml
  def create
    @material_category = MaterialCategory.new(params[:material_category])

    respond_to do |format|
      if @material_category.save
        format.html { redirect_to(@material_category, :notice =>  t('record_created')) }
        format.xml  { render :xml => @material_category, :status => :created, :location => @material_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @material_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /material_categories/1
  # PUT /material_categories/1.xml
  def update
    @material_category = MaterialCategory.find(params[:id])

    respond_to do |format|
      if @material_category.update_attributes(params[:material_category])
        format.html { redirect_to(@material_category, :notice => t('record_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @material_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /material_categories/1
  # DELETE /material_categories/1.xml
  def destroy
    @material_category = MaterialCategory.find(params[:id])
    @material_category.destroy

    respond_to do |format|
      format.html { redirect_to(material_categories_url) }
      format.xml  { head :ok }
    end
  end
end
