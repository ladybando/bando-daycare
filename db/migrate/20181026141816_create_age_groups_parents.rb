class CreateAgeGroupsParents < ActiveRecord::Migration
  def change
    create_table :age_groups_parents do |t|
      t.integer :age_group_id
      t.integer :parent_id
    end
  end
end
