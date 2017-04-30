class Preference < ApplicationRecord
  belongs_to  :user

  validates :min_age, :max_age, :gender, :user_id, presence: true
end
