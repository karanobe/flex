require 'rails_helper'

describe Preference do
  let(:preference) {Preference.create!(min_age: 29, max_age: 87, gender: "Male", user_id: user.id)}
  let(:user) {User.create!(first_name: "Kobe", last_name: "Bryant", age: 22, phone: '7736101700',gender_pronoun: "He", profile_bio: "Get big.", email: "ko@example.com", password: "password", password_confirmation: "password") }

  it "belongs to user" do
    expect(preference.user).to eq(user)
  end

  it "has a min age preference" do
    expect(preference.user.preference.min_age).to eq(29)
  end

  it "has a max age preference" do
    expect(preference.user.preference.max_age).to eq(87)
  end

  it "has a gender preference" do
    expect(preference.user.preference.gender).to eq("Male")
  end

end
