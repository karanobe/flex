class Gym < ApplicationRecord
  has_many  :memberships
  has_many  :members, through: :memberships, source: :user

  validates :name, :street_address, :city, :state, :zip, presence: true


end
