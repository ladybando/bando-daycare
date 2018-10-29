class Parent < ActiveRecord::Base
   has_many :children
   has_secure_password
   validates :password, length: { in: 6..20, message: "Please add at least 6 characters"}
end
