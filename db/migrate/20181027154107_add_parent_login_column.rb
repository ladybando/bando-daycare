class AddParentLoginColumn < ActiveRecord::Migration

    def change
      add_column :parents, :username, :string
      add_column :parents, :email, :string
      add_column :parents, :password_digest, :string
    end
  end

