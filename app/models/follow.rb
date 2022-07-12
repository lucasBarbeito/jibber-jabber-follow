class Follow < ApplicationRecord
  validates :followed_user_id, presence: true, uniqueness: true
  validate :doesnt_follow_self

  private

  def doesnt_follow_self
    errors.add(:base, 'You can\'t follow yourself') if follower_user_id == followed_user_id
  end
end
