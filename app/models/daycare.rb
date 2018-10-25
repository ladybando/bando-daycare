class Daycare < ActiveRecord::Base
  has_many :children
  has_one :age_group
  has_one :parent, :through => :age_group

  binding.pry
end
