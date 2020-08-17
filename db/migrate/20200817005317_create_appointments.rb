class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :condition
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end