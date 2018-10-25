class CreateAgeGroup < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|
      t.string :title
      t.string :description
      t.integer :daycare_id
    end
  end
end
