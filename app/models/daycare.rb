class Daycare < ActiveRecord::Base
  has_many :age_groups
  has_many :children
  has_many :parents

  has_secure_password
end
