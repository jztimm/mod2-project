class AddAdditionalInfoToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :additional_info, :text
  end
end
