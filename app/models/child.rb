require 'pry'
class Child < ActiveRecord::Base
  belongs_to :age_group
  belongs_to :daycare
  belongs_to :parent

end
