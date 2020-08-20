class AddStateToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :state, :string
  end
end
