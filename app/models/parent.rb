class Parent < ActiveRecord::Base
   has_many :children
   has_secure_password

end
