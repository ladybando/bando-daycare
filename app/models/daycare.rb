class Daycare < ActiveRecord::Base
  has_many :child_groups
  has_many :parents, through: :child_groups
  binding.pry
end
