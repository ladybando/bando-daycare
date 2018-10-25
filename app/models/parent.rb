class Parent < ActiveRecord::Base
   has_many :children
   belongs_to :age_group
   belongs_to :daycare
end
