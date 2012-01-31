class UserSession  < Authlogic::Session::Base

  #rails 3 error, needed to add.
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

  def persisted?
    false
  end

end
