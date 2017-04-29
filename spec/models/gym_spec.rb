require 'rails_helper'

describe Gym do
  let(:user) { User.create!(first_name: "Kobe", last_name: "Bryant", age: 25, gender_pronoun: "He", profile_bio: "Get big.", email: "ko@example.com", password: "password", password_confirmation: "password") }

  let(:user_2) { User.create!(first_name: "Joe", last_name: "Butt", age: 25, gender_pronoun: "He", profile_bio: "Get yolked", email: "email.@gmail.com", password: "password", password_confirmation: "password") }

  let(:gym) { Gym.create!(name: 'XSport', street_address: '666 S. Hell Blvd', state: 'Drillinois', zip: 60669)}


  it "has a name and address" do
    expect(gym.name).to eq("XSport")
    expect(gym.street_address).to eq("666 S. Hell Blvd")
    expect(gym.state).to eq("Drillinois")
    expect(gym.zip).to eq(60669)
  end


  it "has a member" do
    Membership.create!(gym_id: gym.id, user_id: user.id)
    expect(gym.members.first).to eq(user)
  end

  it "has many memberships" do
    Membership.create!(gym_id: gym.id, user_id: user.id)
    Membership.create!(gym_id: gym.id, user_id: user_2.id)
    expect(gym.memberships.length).to eq(2)
  end
end

