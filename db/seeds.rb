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
  programs = Program.all
  machines = Machine.all
  materials = Material.all
  licenses = License.all

  fabmoment = user.fabmoments.find_or_create_by(title: title)
  fabmoment.description = Faker::Lorem.paragraph
  rand(1..5).times do
    fabmoment.programs << programs.sample
  end
  rand(1..5).times do
    fabmoment.machines << machines.sample
  end
  rand(1..5).times do
    fabmoment.materials << materials.sample
  end
  fabmoment.license = licenses.sample

  fabmoment.save
  fabmoment
end

def create_machine(name, capacity)
  machine = Machine.find_or_create_by(name: name)
  machine.create_usage(capacity: capacity)
  machine
end

unless Machine.exists?(name: "Ultimaker Three")
  create_machine("Ultimaker Three", 1)
  create_machine("Ultimaker Original Plus", 1)
  create_machine("Ultimaker Two", 3)
  create_machine("Ultimaker Two Plus", 2)
  create_machine("Lasersnijder", 1)
  create_machine("Vinylsnijder", 1)
  create_machine("3D Scanner", 1)
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

unless User.exists?(email: "info@fablabzeeland.com")
  user_1 = User.create!(username: "De Fabmanager",
                        email: "info@fablabzeeland.com",
                        password: "12345",
                        admin: true)

  create_fabmoment(user_1, Faker::App.name)
  create_fabmoment(user_1, Faker::App.name)
end

unless User.all.size > 1
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

unless ActsAsTaggableOn::Tag.any?
  Fabmoment.all.each do |fabmoment|
    fabmoment.tag_list.add Faker::Lorem.words(0..8)
    fabmoment.save
  end
end

## Creeer comments en likes
unless Comment.any?
  fabmoments = Fabmoment.all
  users = User.all
  25.times do
    Comment.create(text: Faker::Lorem.paragraph(1..3),
                   fabmoment: fabmoments.sample,
                   author: users.sample)
    fabmoments.sample.liked_by users.sample
  end
end

## Vul agenda op
unless Reservation.any?
  users = User.all
  machines = Machine.all
  4.times do
    MachineOccupation.create(user: users.sample,
                             machine: machines.sample)
  end
  60.times do
    start_time = Time.now + 1.month + rand(0..20).days + rand(0..4).hours
    Reservation.create(user: users.sample,
                       machines: [machines.sample, machines.sample],
                       title: "Reservering: #{Faker::App.name}",
                       description: Faker::Lorem.paragraph(1..3),
                       start_time: start_time,
                       end_time: start_time + rand(1..2).hour,
                       approved: [true, false].sample )
  end
end

unless ControlPanel.any?
  ControlPanel.create(
    max_machines_to_occupy: 1,
    max_minutes_to_occupy_one_machine: 30,
    open_hour: false
  )
end

# ReturningActivity.delete_all
# WeeklyTimeTable.delete_all

unless WeeklyTimeTable.any?
  regular = WeeklyTimeTable.create(
    control_panel: ControlPanel.first,
    title: "Fablab weekschema",
    subtitle: "Openingstijden buiten alle vakanties om.",
    active: true
  )
  regular.returning_activities.create(
    day: :monday,
    start_time: "17:00",
    end_time: "20:00",
    caption: "Open inloop"
  )
  regular.returning_activities.create(
    day: :tuesday,
    start_time: "13:00",
    end_time: "17:00",
    caption: "Open inloop"
  )
  regular.returning_activities.create(
    day: :tuesday,
    start_time: "18:00",
    end_time: "20:00",
    caption: "Cursus"
  )
  regular.returning_activities.create(
    day: :wednesday,
    caption: "Alleen op afspraak"
  )
  regular.returning_activities.create(
    day: :thursday,
    caption: "Alleen op afspraak"
  )
  regular.returning_activities.create(
    day: :friday,
    start_time: "10:00",
    end_time: "12:00",
    caption: "Cursus"
  )
  regular.returning_activities.create(
    day: :friday,
    start_time: "13:00",
    end_time: "17:00",
    caption: "Open inloop"
  )
  regular.save

  WeeklyTimeTable.create!(
    control_panel: ControlPanel.first,
    title: "Fablab weekschema",
    subtitle: "van 1 juli tot 15 augustus",
    active: false
  )
end
