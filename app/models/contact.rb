class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Person < ActiveRecord::Base
  validates :email, presence: true, email: true
end

class Contact < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true, email: true
	validates :body, presence: true

end