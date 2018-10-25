class Parent < ActiveRecord::Base
   has_many :children
   belongs_to :daycare
end
