require 'pry'
class Child < ActiveRecord::Base
  belongs_to :parent
  has_one :daycare, through: :age_group

end
