class Pool < ApplicationRecord
  belongs_to :super_admin, class_name: "User", foreign_key: :user_id
  enum game: { prop_bet: 0 }
end
