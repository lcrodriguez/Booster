class Route  < AccountScoped
  belongs_to :user
  
  has_many :route_lines, :dependent => :destroy
  
  accepts_nested_attributes_for :route_lines, :reject_if => lambda { |a| a[:comments].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :start_date
  validates_associated :route_lines

  default_scope lambda { where(:account_id => Account.current) }
  
  def validate
     found = false
    
     route_lines.each do |ri|
        found = true if !ri.comments.blank?
     end
    
     errors.add_to_base I18n.translate("error_amount_lines", :count => 1) if !found
  end

  def self.search(params)
    search = scoped
    search = search.where(:user_id => params[:user]) if params[:user].present?

    if params[:start_date].present? && params[:start_date][:year] != "" && params[:start_date][:month] != "" && params[:start_date][:day] != ""
      search = search.where(:start_date => Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i))
    end
    search = search.where('LOWER(name) like :text OR LOWER(description) like :text', 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return search.paginate :page => params[:page]
  end
end
