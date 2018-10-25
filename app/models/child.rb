require 'pry'
class Child < ActiveRecord::Base
  belongs_to :parent
  belongs_to :daycare
  belongs_to :age_group
end
