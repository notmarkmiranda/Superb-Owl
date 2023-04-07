class Membership < ApplicationRecord
  belongs_to :pool
  belongs_to :user

  validates :user_id, uniqueness: { scope: :pool_id }
end
