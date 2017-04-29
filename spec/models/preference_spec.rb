require 'rails_helper'

describe Preference do
  let(:preference) {Preference.create!(age_range: "20-25", gender: "Male", user_id: user.id)}
  let(:user) {User.create!(first_name: "Kobe", last_name: "Bryant", age: 25, gender_pronoun: "He", profile_bio: "Get big.", email: "ko@example.com", password: "password", password_confirmation: "password") }

  it "belongs to user" do
    expect(preference.user).to eq(user)
  end

  it "has a age preference" do
    expect(preference.user.preference.age_range).to eq("20-25")
  end

  it "has a gender preference" do
    expect(preference.user.preference.gender).to eq("Male")
  end

end
