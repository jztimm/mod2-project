# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Seeds..."

15.times do
   Doctor.create(name: Faker::Name.unique.name, specialty: Faker::Company.profession )
end

25.times do
   Patient.create(name: Faker::Name.unique.name, age: rand(1..150), city: Faker::Address.city, zipcode: Faker::Address.zip_code)
end

50.times do
   Appointment.create(patient_id: Patient.all.sample.id, doctor_id: Doctor.all.sample.id, condition: Faker::Movies::StarWars.specie , date: Faker::Date.between(from: '2020-09-23', to: '2024-09-25'), time: Faker::Time.forward(days: 23, period: :morning))
end

puts "Done!!"

p Doctor.count
p Patient.count
p Appointment.count

