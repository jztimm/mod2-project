class AddBirthdayToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :birthday, :date
  end
end
