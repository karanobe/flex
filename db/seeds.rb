# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Users
ko = User.create!(first_name: "Karan", last_name: "Oberoi", age: 25,  phone: '9518807001', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "k@gmail.com", password: "password", password_confirmation: "password")
tn = User.create!(first_name: "Ted", last_name: "N", age: 99, phone: '2246169035', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "t@gmail.com", password: "password", password_confirmation: "password")
sg = User.create!(first_name: "Sara", last_name: "Gerou", age: 25, phone: '7736101700', gender_pronoun: "She/Her", profile_bio: "Profile Biography", email: "s@gmail.com", password: "password", password_confirmation: "password")
ek = User.create!(first_name: "Elsie", last_name: "Koglin", age: 54, phone: '7735766373', gender_pronoun: "She/Her", profile_bio: "Profile Biography", email: "e@gmail.com", password: "password", password_confirmation: "password")
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


# Users
# ko = User.create!(first_name: "Karan", last_name: "Oberoi", age: 25,  phone: '9518807001', gender_pronoun: "He/Him", profile_bio: "I'm excited to get started. My workout goals are to get swole for da summer. They say a summer body is born in the winter, but I missed the boat on that one. I'm free M-F, anytime after 6:30pm. Hit me up!", email: "k@gmail.com", password: "password", password_confirmation: "password")
# tn = User.create!(first_name: "Ted", last_name: "N", age: 99, phone: '2246169035', gender_pronoun: "He/Him", profile_bio: "I'm excited to get started. My workout goals are to get swole for da summer. They say a summer body is born in the winter, but I missed the boat on that one. I'm free M-F, anytime after 6:30pm. Hit me up!", email: "t@gmail.com", password: "password", password_confirmation: "password")
# jg = User.create!(first_name: "Jerry", last_name: "Gerou", age: 25, phone: '7736101700', gender_pronoun: "She/Her", profile_bio: "Oh hello! I'm really excited to get started! I'm in excellent shape as is, so mostly I just want someone else to walk around the gym with and feel accomplished without doing any work. Let's schedule something!", email: "j@gmail.com", password: "password", password_confirmation: "password")
# ek = User.create!(first_name: "Elsie", last_name: "Koglin", age: 54, phone: '7735766373', gender_pronoun: "She/Her", profile_bio: "Yo yo yo! Let's hit the gym. I'm unemployed, willing to travel to any gym and available around the clock. Will you be my flex-mate?!", email: "e@gmail.com", password: "password", password_confirmation: "password")
# dg = User.create!(first_name: "Derek", last_name: "Gregorivich", age: 88, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "I'm flabby. I need a gym buddy. I like lifting, treadmills, basketball and yoga. I'm available on the weekends anytime! Looking forward to hearing form you", email: "d@gmail.com", password: "password", password_confirmation: "password")
# cf = User.create!(first_name: "Chris", last_name: "Frazz", age: 25, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "I'm flabby. I need a gym buddy. I like lifting, treadmills, basketball and yoga. I'm available on the weekends anytime! Looking forward to hearing form you", email: "c@gmail.com", password: "password", password_confirmation: "password")
# bw = User.create!(first_name: "Brendan", last_name: "White", age: 25, phone: '3125667272', gender_pronoun: "He/Him", profile_bio: "Profile Biography", email: "b@gmail.com", password: "password", password_confirmation: "password")
# ao = User.create!(first_name: "Alex", last_name: "Origitano", age: 21, phone: '3125667272', gender_pronoun: "She/Her", profile_bio: "Yo yo yo! Let's hit the gym. I'm unemployed, willing to travel to any gym and available around the clock. Will you be my flex-mate?!", email: "a@gmail.com", password: "password", password_confirmation: "password")
# ken = User.create!(first_name: "Ken", last_name: "Sag", age: 35,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "Yo yo yo! Let's hit the gym. I'm unemployed, willing to travel to any gym and available around the clock. Will you be my flex-mate?!", email: "ken@gmail.com", password: "password", password_confirmation: "password")
# avner = User.create!(first_name: "Avner", last_name: "Shanan", age: 55,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "I need a gym buddy. Preferably it would be someone I work with who understands and appreciates my sparkling personality. I'm available at 6:01pm Monday through Friday.", email: "avner@gmail.com", password: "password", password_confirmation: "password")
# duke = User.create!(first_name: "Duke", last_name: "Duke", age: 53,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "If I'm not at the gym, you can bet I'm up to no good in the neighborhood. I'm looking for someone with a sparkling personality that needs a gym buddy at 6:01pm, Monday through Friday. I hope you like jokes.", email: "duke@gmail.com", password: "password", password_confirmation: "password")
# ellie = User.create!(first_name: "Ellie", last_name: "Poley", age: 24,  phone: '3232212344', gender_pronoun: "She/Her", profile_bio: "I'll probably come to the gym dressed like a pink dinosaur. Dig it.", email: "ellie@gmail.com", password: "password", password_confirmation: "password")
# pete = User.create!(first_name: "Pete", last_name: "Masculine", age: 19,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "Beard in need of a gym buddy. Don't be a creep.", email: "pete@gmail.com", password: "password", password_confirmation: "password")
# alyssa = User.create!(first_name: "Alyssa", last_name: "Diaz", age: 27,  phone: '3232212344', gender_pronoun: "She/Her", profile_bio: "I often dress like a manatee when I work out. I'm hoping to find someone who likes to as dress as creatures... like say, a pink dinosaur? Let's get ripped!", email: "alyssa@gmail.com", password: "password", password_confirmation: "password")
# matt = User.create!(first_name: "Matt", last_name: "Baker", age: 17,  phone: '3232212344', gender_pronoun: "He/Him", profile_bio: "Someone get me out of the woods and make me accountable to workout.", email: "matta@gmail.com", password: "password", password_confirmation: "password")
