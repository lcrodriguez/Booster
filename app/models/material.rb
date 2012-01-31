class Material < AccountScoped
  belongs_to :material_category
  default_scope lambda { where(:account_id => Account.current) }
  
  def self.search(params)
    materials = scoped
    materials = materials.where(:material_category_id => params[:material_category]) if params[:material_category].present?
    materials = materials.where('LOWER(name) like :text OR LOWER(code) like :text', 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return materials.paginate :page => params[:page]
  end
  
  validates :name, :presence => true
end
