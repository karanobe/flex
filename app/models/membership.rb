class Membership < ApplicationRecord
  belongs_to  :user
  belongs_to  :gym

  validates :gym_id, :user_id, presence: true


end
