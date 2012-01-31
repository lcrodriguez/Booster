class Visit < AccountScoped
  default_scope lambda { where(:account_id => Account.current) }
  
  #autocomplete :doctor, :full_name
  
  belongs_to :user
  belongs_to :request
  belongs_to :doctor

  has_many :visitdetails, :dependent => :destroy
  attr_accessor :docname
  
  accepts_nested_attributes_for :visitdetails, :reject_if => lambda { |a| a[:quantity].blank? }, :allow_destroy => true
  
  validates_presence_of :visiton, :docname
  validates_associated :visitdetails

  def self.search(params)
    items = scoped
    items = items.where(:request_id => params[:request]) if params[:request].present?
    if params[:visiton].present? && params[:visiton][:year] != "" && params[:visiton][:month] != "" && params[:visiton][:day] != ""
      items = items.where(:visiton => Date.civil(params[:visiton][:year].to_i, params[:visiton][:month].to_i, params[:visiton][:day].to_i))
    end
    
    return items.paginate :page => params[:page]
  end
  
  
  def validate

    errors.add_to_base "El medico no existe" if docname.present? && Doctor.find_autocomplete({ :term => docname}).count == 0    

    found = false
    
     visitdetails.each do |ri|
        found = true if !ri.quantity.blank?
     end
    
     errors.add_to_base I18n.translate("error_amount_lines", :count => 1) if !found
  end
end
