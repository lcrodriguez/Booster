class Doctor < AccountScoped
  belongs_to :speciality
  belongs_to :user
  belongs_to :state
  belongs_to :city
  
  cattr_reader :per_page
  @@per_page = 50
  
  def full_name
    "#{first_name} #{last_name}"
  end

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
    doctors = scoped
    doctors = doctors.where(:state_id => params[:state]) if params[:state].present?
    doctors = doctors.where(:city_id => params[:city]) if params[:city].present?
    doctors = doctors.where(:speciality_id => params[:speciality]) if params[:speciality].present?
    doctors = doctors.where('LOWER(first_name) like :text OR LOWER(last_name) like :text OR LOWER(zip_code) like :text OR LOWER(street) like :text' , 
      { :text => "%" + params[:text].downcase + "%" }) if params[:text].present?
    return doctors.paginate :page => params[:page]
  end
  
  def self.find_autocomplete(params)
    doctors = scoped
    doctors = doctors.where('LOWER(first_name) like :term OR LOWER(last_name) like :term' , 
      { :term => "%" + params[:term].downcase.strip + "%" }) if params[:term].present?
    return doctors
  end
  
  def self.import(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    
    FasterCSV.foreach(path, {:headers => true, :quote_char=>'"', :col_sep =>","}) do |row_data|
      
      @name = row_data['Nombre'].title_case
      @direccion = row_data['Domicilio'].title_case
      @localidad = row_data['Localidad'].title_case
      @cp = row_data['Cod_Postal'];
      @cp = @cp.sub! /\A0+/, '' if @cp.present?
      
      @barrio = row_data['Barrio']
      @barrio = @barrio.title_case if @barrio.present?
      
      if @localidad != 'CIUDAD AUTONOMA BUEN'.title_case
        @barrio = @localidad
        @localidad = 'BUENOS AIRES'.title_case
      end
      
      @localidad = "Ciudad Autónoma de Buenos Aires" if @localidad == 'CIUDAD AUTONOMA BUEN'.title_case

      @especialidad = Speciality.find_or_create_by_name(row_data['Esp1'].title_case)
      @especialidad.save
      @state = State.find_or_create_by_name(@localidad)
      @state.save
      if @barrio.present?
        @city = City.find_or_create_by_name(@barrio, :state => @state) 
        @city.save
      end
      
      new_record = Doctor.find_or_create_by_first_name(@name,
      {
        :city => @city,
        :state => @state,
        :zip_code => @cp,
        :street => @direccion,
        :speciality =>  @especialidad
      }
      )
      
      if !new_record.save(false)
        new_record.errors.full_messages.each do |msg|
          logger.info 'error' + msg
        end
      end
        
    end
  end
  
  default_scope lambda { where(:account_id => Account.current) }
  
  validates_presence_of :first_name, :last_name, :street, :zip_code
  validates :email, :email => true
end
