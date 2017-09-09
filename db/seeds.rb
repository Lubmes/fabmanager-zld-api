# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fabmoment.delete_all
# User.delete_all

def create_user(admin = false)
  name = Faker::Internet.user_name
  user = User.create!(username: name,
                      email: Faker::Internet.free_email(name),
                      password: "12345",
                      admin: admin)
end

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

  create_fabmoment(user_1, Faker::App.name)
  create_fabmoment(user_1, Faker::App.name)
end

user_2 = create_user
user_3 = create_user

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
