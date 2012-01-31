class Speciality < AccountScoped
  default_scope lambda { where(:account_id => Account.current) }
  
  validates_presence_of :name
end
