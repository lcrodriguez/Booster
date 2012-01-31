class RouteLine  < AccountScoped
  belongs_to :route
  belongs_to :city
  belongs_to :state
  
  default_scope lambda { where(:account_id => Account.current) }
end
