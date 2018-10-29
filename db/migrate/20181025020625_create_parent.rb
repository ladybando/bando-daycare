class CreateParent < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.text :username
      t.text :password_digest
    end
  end
end
