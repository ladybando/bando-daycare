class Child::AgeGroup < ActiveRecord::Base
  # add relationships here
    belongs_to :child
    belongs_to :age_group
end
