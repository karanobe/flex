class User < ApplicationRecord
  has_many  :memberships
  has_many  :gyms, through: :memberships, source: :gym
  has_one   :preference

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, :last_name, :age, :gender_pronoun, :profile_bio, presence: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # in progress, needs logic to filter by gym (zip)????
  def ordered_json
    primary_gym = self.memberships.find_by(primary_gym: true).gym
    gym_users = primary_gym.members
    gym_users.map {|user| p user.first_name}
    gym_users.to_json
  end
end


# age range - not string, but min and max integers
# pull user if age falls within range
# preference.min < user.age < preference.max

