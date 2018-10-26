class AgeGroupsParents < ActiveRecord::Base
    belongs_to :age_groups
    belongs_to :parents

end
