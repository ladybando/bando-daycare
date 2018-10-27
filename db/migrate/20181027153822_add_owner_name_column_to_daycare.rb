class AddOwnerNameColumnToDaycare < ActiveRecord::Migration
  def change
    add_column :daycares, :username, :string
    add_column :daycares, :email, :string
    add_column :daycares, :password_digest, :string
  end
end
