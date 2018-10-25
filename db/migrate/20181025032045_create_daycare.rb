class CreateDaycare < ActiveRecord::Migration
  def change
    create_table :daycares do |t|
      t.text :address
      t.text :phone_number
    end
  end
end
