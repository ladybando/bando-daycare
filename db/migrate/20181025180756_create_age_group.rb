class CreateAgeGroup < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|
      t.integer :age_group
      t.integer :daycare_id
    end
  end
end
