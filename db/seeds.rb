# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Users
ko = User.create!(first_name: "Karan", last_name: "Oberoi", age: 25,  phone: '7736101700', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "k@gmail.com", password: "password", password_confirmation: "password")
tn = User.create!(first_name: "Ted", last_name: "N", age: 99, phone: '7736101700', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "t@gmail.com", password: "password", password_confirmation: "password")
sg = User.create!(first_name: "Sara", last_name: "Gerou", age: 25, phone: '7736101700', gender_pronoun: "She/Her", profile_bio: "Profile Biography", email: "s@gmail.com", password: "password", password_confirmation: "password")
ek = User.create!(first_name: "Elsie", last_name: "Koglin", age: 54, phone: '7736101700', gender_pronoun: "She/Her", profile_bio: "Profile Biography", email: "e@gmail.com", password: "password", password_confirmation: "password")
dg = User.create!(first_name: "Derek", last_name: "Gregorivich", age: 88, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "d@gmail.com", password: "password", password_confirmation: "password")
cf = User.create!(first_name: "Chris", last_name: "Frazz", age: 25, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "c@gmail.com", password: "password", password_confirmation: "password")
bw = User.create!(first_name: "Brendan", last_name: "White", age: 25, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "b@gmail.com", password: "password", password_confirmation: "password")
ao = User.create!(first_name: "Alex", last_name: "Origitano", age: 21, phone: '3125667272', gender_pronoun: "She/Her", profile_bio: "Profile Biography", email: "a@gmail.com", password: "password", password_confirmation: "password")
ken = User.create!(first_name: "Ken", last_name: "Sag", age: 35,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "ken@gmail.com", password: "password", password_confirmation: "password")


# Gyms
Gym.create!(name: "24 Hour Fitness", street_address: "111 Street Ave.", city: "Corona", state: "CA", zip: 92879)
Gym.create!(name: "LA Fitness", street_address: "222 Street Ave.", city: "Corona", state: "CA", zip: 92879)
Gym.create!(name: "Fitness 19", street_address: "333 Street Ave.", city: "Corona", state: "CA", zip: 92879)
Gym.create!(name: "Planet Fitness", street_address: "444 Street Ave.", city: "Corona", state: "CA", zip: 92879)
Gym.create!(name: "GloboGym", street_address: "555 Street Ave.", city: "Corona", state: "CA", zip: 92879)
Gym.create!(name: "Gold's Gym", street_address: "666 Street Ave.", city: "Corona", state: "CA", zip: 92879)


# Memberships
ko.memberships.create(gym_id: 1,primary_gym: true)
ko.memberships.create(gym_id: 2)
tn.memberships.create(gym_id: 2)
tn.memberships.create(gym_id: 3, primary_gym: true)
sg.memberships.create(gym_id: 3, primary_gym: true)
sg.memberships.create(gym_id: 4)
ek.memberships.create(gym_id: 4)
ek.memberships.create(gym_id: 5, primary_gym: true)
dg.memberships.create(gym_id: 5, primary_gym: true)
dg.memberships.create(gym_id: 6)
cf.memberships.create(gym_id: 6, primary_gym: true)
cf.memberships.create(gym_id: 1)
bw.memberships.create(gym_id: 1)
bw.memberships.create(gym_id: 2, primary_gym: true)
ao.memberships.create(gym_id: 2)
ao.memberships.create(gym_id: 3, primary_gym: true)
