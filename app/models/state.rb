class State < AccountScoped#ActiveRecord::Base
  
  has_many :cities
  
  default_scope lambda { where(:account_id => Account.current).order("name asc") }
  
  validates_presence_of :name
end
