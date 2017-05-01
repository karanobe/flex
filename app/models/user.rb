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

  validates :first_name, :last_name, :age, :gender_pronoun, :profile_bio, presence: true
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
    primary_gym = self.memberships.find_by(primary_gym: true).gym
    gym_users = primary_gym.members
    gym_users.to_json
  end
end


# age range - not string, but min and max integers
# pull user if age falls within range
# preference.min < user.age < preference.max

