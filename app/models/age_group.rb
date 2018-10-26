
class AgeGroup < ActiveRecord::Base
    has_many :children
    belongs_to :daycare
    has_many :parents

end
