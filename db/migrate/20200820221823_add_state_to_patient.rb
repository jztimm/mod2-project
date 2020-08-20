class AddStateToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :state, :string
  end
end
