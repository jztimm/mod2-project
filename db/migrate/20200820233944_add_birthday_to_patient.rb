class AddBirthdayToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :birthday, :date
  end
end
