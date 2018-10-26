class CreateAgeGroup < ActiveRecord::Migration
  def change
    create_table :age_groups do |t|
      t.string :description
      t.string :title
      t.integer :daycare_id
    end
  end
end
