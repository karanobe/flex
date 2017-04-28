class Preference < ApplicationRecord
  belongs_to  :user

  validates :age_range, :gender, :user_id, presence: true
end
