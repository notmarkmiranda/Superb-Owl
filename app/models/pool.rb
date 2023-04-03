class Pool < ApplicationRecord
  TYPES = { "Prop Bets" => 0 }
  belongs_to :super_admin, class_name: "User", foreign_key: :user_id
  enum game: [:prop_bet]
end
