class ChildGroup< ActiveRecord::Base
  # add relationships here
    belongs_to :child
    belongs_to :age_group
    belongs_to :daycare
end
