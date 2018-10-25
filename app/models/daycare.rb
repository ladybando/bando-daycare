require 'pry'
class Daycare < ActiveRecord::Base
  has_many :parents
  has_many :child_groups
  has_many :children, through: :child_groups
  #binding.pry
end
