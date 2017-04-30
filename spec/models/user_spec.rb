require 'rails_helper'

describe User do
  let(:user) { User.create!(first_name: "Kobe", last_name: "Bryant", age: 25, phone: '7736101700',gender_pronoun: "He", profile_bio: "Get big.", email: "ko@example.com", password: "password", password_confirmation: "password") }
  let(:gym) { Gym.create!(name: 'XSport', street_address: '666 S. Hell Blvd', city: "Chicago", state: 'Drillinois', zip: 60669)}
  let(:gym_2) { Gym.create!(name: 'LA Fitness', street_address: '111 Street Ave', city: "Corona", state: 'California', zip: 92879)}


  it "has a first and last name" do
    expect(user.first_name).to eq("Kobe")

    expect(user.last_name).to eq("Bryant")
  end

  it "has an age and gender pronoun" do
    expect(user.age).to eq 25
    expect(user.gender_pronoun).to eq("He")
  end

  it "has a profile bio" do
    expect(user.profile_bio).to eq("Get big.")
  end

  it "has user authentication with encrypted password" do
    expect(user.email).to eq ("ko@example.com")

    expect(user.encrypted_password.class).to eq String
  end

  it "has many gyms" do
    Membership.create!(gym_id: gym.id, user_id: user.id)
    Membership.create!(gym_id: gym_2.id, user_id: user.id)
    expect(user.gyms.length).to eq 2
  end
end
