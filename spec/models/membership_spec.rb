require 'rails_helper'

describe Membership do
  let(:user) { User.create!(first_name: "Kobe", last_name: "Bryant", age: 25, phone: '7736101700',gender_pronoun: "He", profile_bio: "Get big.", email: "ko@example.com", password: "password", password_confirmation: "password") }

  let(:gym) { Gym.create!(name: 'XSport', street_address: '666 S. Hell Blvd', city: "Chicago", state: 'Drillinois', zip: 60669)}

  let(:membership) {Membership.create!(gym_id: gym.id, user_id: user.id)}

  it "has a user" do
    expect(membership.user).to eq(user)
  end

  it "has a gym" do
    expect(membership.gym).to eq(gym)
  end
end
