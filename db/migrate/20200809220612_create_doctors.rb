class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :age
      t.string :specialty
      t.string :city
      t.integer :zipcode

      t.timestamps
    end
  end
end
