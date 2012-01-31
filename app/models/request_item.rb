class RequestItem < AccountScoped
  belongs_to :request
  belongs_to :material
  
  default_scope lambda { where(:account_id => Account.current) }
  
  validates_presence_of :quantity, :on => :update
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0
end
