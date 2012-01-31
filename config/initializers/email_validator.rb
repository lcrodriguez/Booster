class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if !value.present? || value.empty?
      
    record.errors[attribute] << (options[:message] || "no es válido.") unless
      value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end