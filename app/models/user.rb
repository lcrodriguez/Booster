class User <  AccountScoped
  acts_as_authentic
  belongs_to :user_type

  def self.normals
    return scoped.joins(:user_type).where("user_types" => {:is_admin => false})
  end
  
  default_scope lambda { where(:account_id => Account.current).order("username asc") }
  
  validates_length_of :username, :in => 6..20
  validates_length_of :password, :in => 6..20, :if => "password.present?"
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_presence_of :username, :first_name, :last_name, :email
  validates :email, :email => true
  validates_confirmation_of :password, :on => :create
  
  validates_uniqueness_of :email
end