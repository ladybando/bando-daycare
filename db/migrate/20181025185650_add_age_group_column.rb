class AddAgeGroupColumn < ActiveRecord::Migration
  def change
    add_column :daycares, :age_group, :integer
  end
end
