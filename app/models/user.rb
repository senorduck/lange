class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_format_of :email_address, :with => EMAIL_REGEX
end
