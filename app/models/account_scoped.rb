class AccountScoped < ActiveRecord::Base
  self.abstract_class = true

  class << self
    protected
      def current_scoped_methods
        
         method = scoped_methods.last
         if method.respond_to?(:call)
            relation.scoping { method.call }
         else
            method
         end
      end      
  end

  belongs_to :account

  before_save { self.account = Account.current }

  #default_scope lambda where(:account_id => Account.current)
  
  #default_scope lambda { where('account_id = ?', Account.current) }
end