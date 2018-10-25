class ChildGroups < ActiveRecord::Migration
  def change
    create_table :child_groups do |t|
      t.integer :child_id
      t.integer :groups_id
    end
  end
end
