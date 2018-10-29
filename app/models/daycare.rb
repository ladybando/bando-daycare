class Daycare < ActiveRecord::Base
  has_many :age_groups
  has_many :children
  has_many :parents

  has_secure_password
  validates :password, length: { in: 6..20, message: "Please add at least 6 characters"}
end
