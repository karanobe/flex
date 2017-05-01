class User < ApplicationRecord
  has_many  :memberships
  has_many  :gyms, through: :memberships, source: :gym
  has_one   :preference
  has_many :friendships
  has_and_belongs_to_many :all_friends,
    class_name: "User", join_table: :friendships, foreign_key: :user_id, association_foreign_key: :friend_id

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, :last_name, :age, :gender_pronoun, :profile_bio, :phone, presence: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def friends
    actual_friendships = self.friendships.select {|friendship| friendship.status == "Accepted" }
    actual_friendships.map { |frienship| User.find(frienship.friend_id) }
  end

  def request_sent
    requested_friendships = self.friendships.select {|friendship| friendship.status == "Request Sent" }
    requested_friendships.map { |friendship| User.find(friendship.friend_id) }
  end

  def request_received
    received_friendships = Friendship.where(friend_id: self.id, status: "Request Sent")
    received_friendships.map { |friendship| User.find(friendship.user_id) }
  end
  # in progress, needs logic to filter by gym (zip)????
  def ordered_json
    gym_mates = self.memberships.find_by(primary_gym: true).gym.members

    age_mates = gym_mates.where("age >= ? AND age <= ?", self.preference.min_age, self.preference.max_age)
    gender_mates = age_mates.where("gender_pronoun = ?", self. preference.gender)
    # gender_mates
    # select all from Users where age is greater than (>) min age, and less than (<) max age
    # (self.memberships.find_by(primary_gym: true).members).where("age >= ? AND age <= ?", self.preference.min_age, self.preference.max_age)
    gender_mates.to_json
  end
end

