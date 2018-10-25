class CreateParent < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.text :phone_number
      t.integer :age_group_id
    end
  end
end
