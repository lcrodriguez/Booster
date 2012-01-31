class City < AccountScoped
  belongs_to :state
  
  default_scope lambda { where(:account_id => Account.current).order("name asc") }
  
  validates_presence_of :name
end
