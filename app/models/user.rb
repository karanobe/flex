class User < ApplicationRecord
  has_many  :memberships
  has_many  :gyms, through: :memberships, source: :gym
  has_one   :preference

  validates :first_name, :last_name, :age, :gender_pronoun, :profile_bio, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
