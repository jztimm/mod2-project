class RemoveAgeFromPatient < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :age
    remove_column :doctors, :age
  end
end
