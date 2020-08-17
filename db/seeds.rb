# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do
   Doctor.create(name: Faker::Name.unique.name, specialty: Faker::Company.profession )
end

25.times do
   Patient.create(name: Faker::Name.unique.name, condition: Faker::App.unique.name )
end




