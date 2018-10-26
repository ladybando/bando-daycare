require "pry"
class AgeGroup < ActiveRecord::Base
    has_many :children
    has_and_belongs_to_many :parents
    belongs_to :daycare
#binding.pry
end
