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

unless User.any?
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
end

# creeer comments
# Comment.delete_all
unless Comment.any?
  fabmoments = Fabmoment.all
  users = User.all
  25.times do
    Comment.create(text: Faker::Lorem.paragraph(1..3),
                   fabmoment_id: fabmoments.sample.id,
                   author_id: users.sample.id)
  end
end


unless Machine.exists?(name: "Ultimaker Original", capacity: 1)
  m1 = Machine.create(name: "Ultimaker Three", capacity: 1)
  m2 = Machine.create(name: "Ultimaker Original Plus", capacity: 1)
  m3 = Machine.create(name: "Ultimaker Two", capacity: 3)
  m4 = Machine.create(name: "Ultimaker Two Plus", capacity: 2)
  m5 = Machine.create(name: "Lasersnijder", capacity: 1)
  m6 = Machine.create(name: "Vinylsnijder", capacity: 1)
  m7 = Machine.create(name: "3D Scanner", capacity: 1)
end

unless Program.exists?(name: "Adobe Illustrator")
  p1 = Program.create(name: "Adobe Illustrator")
  p2 = Program.create(name: "Tinkercad")
  p3 = Program.create(name: "Sketchup")
  p4 = Program.create(name: "Inkscape")
  p5 = Program.create(name: "Blender")
end

unless Material.exists?(name: "Multiplex")
  mt1 = Material.create(name: "Multiplex", thickness: 3)
  mt2 = Material.create(name: "Multiplex", thickness: 4)
  mt3 = Material.create(name: "Multiplex", thickness: 6)
  mt4 = Material.create(name: "Plexiglas", thickness: 3)
  mt5 = Material.create(name: "Plexiglas", thickness: 5)
  mt6 = Material.create(name: "Plexiglas", thickness: 10)
  mt7 = Material.create(name: "Plexiglas", thickness: 15)
  mt8 = Material.create(name: "Karton")
  mt9 = Material.create(name: "Vinyl")
  mt10 = Material.create(name: "Folie")
  mt11 = Material.create(name: "PLA")
end

unless License.exists?(title:"Naamsvermelding")
  License.create(title: "Naamsvermelding",
                 description:
                 %Q{Je staat anderen toe om het werk waar jij auteursrecht op
                   hebt te kopiëren, distribueren, vertonen, en op te voeren,
                   en om afgeleid materiaal te maken dat op jouw werk gebaseerd is –
                   maar uitsluitend als jij vermeld wordt als maker."})
  License.create(title: "Naamsvermelding gelijk delen",
                 description:
                 %Q{Je staat anderen toe om van jouw werk afgeleid
                   materiaal te maken onder de voorwaarde dat zij
                   het onder dezelfde licentie vrijgeven als het
                   originele werk."})
  License.create(title: "Naamsvermelding niet commercieel",
                 description:
                 %Q{Anderen mogen je werk kopiëren, vertonen, distribueren en opvoeren,
                   alsmede materiaal wat op jouw werk gebaseerd is, mits niet voor commerciële doeleinden.})
  License.create(title: "Naamsvermelding niet commercieel gelijk delen",
                 description:
                 %Q{Anderen mogen je werk kopiëren, vertonen, distribueren en opvoeren,
                   alsmede materiaal wat op jouw werk gebaseerd is, mits niet voor commerciële doeleinden.

                   Je staat anderen toe om van jouw werk afgeleid
                   materiaal te maken onder de voorwaarde dat zij
                   het onder dezelfde licentie vrijgeven als het
                   originele werk.})
  License.create(title: "Naamsvermelding geen afgeleide werken",
                 description:
                 %Q{Anderen mogen je werk kopiëren, distribueren, vertonen en opvoeren mits
                   het werk in de originele staat blijft. Het is niet toegestaan dat anderen
                   jouw werk gebruiken als basis voor nieuw materiaal.})
  License.create(title: "Naamsvermelding niet commercieel geen afgeleide werken",
                 description: "license6")
  License.create(title: "Publiek Domein",
                 description: "license7")
end

unless ControlPanel.any?
  ControlPanel.create(
    max_machines_to_occupy: 1,
    max_minutes_to_occupy_one_machine: 30,
    open_hour: false
  )
end
