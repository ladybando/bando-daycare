class AddEmailColumnToParent < ActiveRecord::Migration
  def change
    add_column :parents, :email, :text
  end
end
