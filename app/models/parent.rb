class Parent < ActiveRecord::Base
   has_many :children 
   has_and_belongs_to_many :age_groups
   belongs_to :daycare

     binding.pry
end
