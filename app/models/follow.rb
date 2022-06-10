class Follow < ApplicationRecord
  validates :followed_user_id, :presence => true, :uniqueness => true
end
