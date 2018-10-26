class Parent < ActiveRecord::Base
  has_many :age_groups
   has_many :children
   belongs_to :daycare
end
