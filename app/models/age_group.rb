class AgeGroup < ActiveRecord::Base
  # add relationships here
    has_many :children
    has_many :parents, through: :child_groups
    belongs_to :daycare

end
  
