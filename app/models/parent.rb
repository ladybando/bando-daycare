class Parent < ActiveRecord::Base
  has_many :children
  belongs_to :daycare
  has_one :age_group

end
