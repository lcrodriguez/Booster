class Account < ActiveRecord::Base
  has_many :users
  
  class << self
    def current
      Thread.current[:current_account]
    end

    def current=(account)
      Thread.current[:current_account] = account
    end
  end
  
  validates_presence_of :name, :description, :owner_email

  validates :owner_email, :email => true
  validates :owner_email, :length => {:minimum => 3, :maximum => 254}
end
