# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_fabmoment(user, title)
  fabmoment = user.fabmoments.find_or_create_by(title: title)
  fabmoment.description = Faker::Lorem.paragraph
  fabmoment.save
  fabmoment
end

unless User.exists?(email: "info@fablabzeeland.com")
  user_1 = User.create!(username: "De Fabmanager",
                        email: "info@fablabzeeland.com",
                        password: "12345",
                        admin: true)
end
user_2 = User.create!(username: Faker::Internet.user_name,
                      email: Faker::Internet.free_email,
                      password: "12345")
user_3 = User.create!(username: Faker::Internet.user_name,
                      email: Faker::Internet.free_email,
                      password: "12345")

create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_2, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
create_fabmoment(user_3, Faker::App.name)
