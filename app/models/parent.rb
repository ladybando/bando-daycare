class Parent < ActiveRecord::Base
   has_many :children
   has_and_belongs_to_many :age_groups
   belongs_to :daycare

   has_secure_password
   validates :password, length: { in: 6..20, message: "Please add at least 6 characters"}
end
