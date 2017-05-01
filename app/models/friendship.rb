class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates_presence_of :user_id, :friend_id, :status

  after_destroy :destroy_inverses, if: :has_inverse?

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_friendship_options)
  end

  def inverses
    self.class.where(inverse_friendship_options)
  end

  def inverse_friendship_options
    { user_id: friend_id, friend_id: user_id }
  end

end
