class Institution < AccountScoped
  belongs_to :user
  belongs_to :state
  belongs_to :city
  
  def full_address
    if street.present?
      return "#{street} #{street_number if street_number.present?} #{", " + city.name if city.present?}, #{state.name} (#{zip_code})"
    else
      return ""
    end
  end

  def search_address
    if street.present?
      return "#{street} #{street_number if street_number.present?} #{", " + city.name if city.present?}, #{state.name}"
    else
      return ""
    end
  end
  
  def self.search(params)
    institutions = scoped
    institutions = institutions.where(:state_id => params[:state]) if params[:state].present?
    institutions = institutions.where(:city_id => params[:city]) if params[:city].present?
    institutions = institutions.where('LOWER(name) like :text OR LOWER(zip_code) like :text OR LOWER(street) like :text' , 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return institutions.paginate :page => params[:page]
  end
  
  default_scope lambda { where(:account_id => Account.current) }

  validates_presence_of :name, :street, :zip_code
  validates :email, :email => true
  validates_length_of :name, :minimum => 6
end
