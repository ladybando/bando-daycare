class AddDaycareIdToChild < ActiveRecord::Migration
  def change
    add_column :children, :daycare_id, :integer
  end
end
