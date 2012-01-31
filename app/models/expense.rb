class Expense < AccountScoped
  belongs_to :user
  belongs_to :route
  default_scope lambda { where(:account_id => Account.current) }
  
  validates_presence_of :description, :amount
  validates_numericality_of :amount
  
  def self.search(params)
    items = scoped
    items = items.where(:route_id => params[:route]) if params[:route].present?
    items = items.where(:user_id => params[:user]) if params[:user].present?
    items = items.where('LOWER(name) like :text' , 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return items.paginate :page => params[:page]
  end
end
