class Daycare < ActiveRecord::Base
  has_many :age_groups
  has_many :children
  has_many :parents

  #binding.pry
end
