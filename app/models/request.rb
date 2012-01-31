class Request < AccountScoped
  belongs_to :customer
  belongs_to :user
  
  has_many :request_items, :dependent => :destroy
  
  accepts_nested_attributes_for :request_items, :reject_if => lambda { |a| a[:quantity].blank? }, :allow_destroy => true
  
  default_scope lambda { where(:account_id => Account.current) }
  
  validates_presence_of :name, :description
  validates :status, :presence => true, :on => :update
  validates_associated :request_items

  def self.search(params)
    items = scoped
    items = items.where(:customer_id => params[:customer]) if params[:customer].present?
    items = items.where(:status => params[:status]) if params[:status].present?
    items = items.where('LOWER(name) like :text OR LOWER(description) like :text' , 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return items.paginate :page => params[:page]
  end

  def validate
     found = false
    
     request_items.each do |ri|
        found = true if !ri.quantity.blank?
     end
    
     errors.add_to_base I18n.translate("error_amount_lines", :count => 1) if !found
  end

end
