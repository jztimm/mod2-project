class AddAddressToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :address, :string
  end
end
