class CreateChild < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :parent_id
    end
  end
end
