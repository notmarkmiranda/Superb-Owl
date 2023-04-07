class Pool < ApplicationRecord
  TYPES = { "Prop Bets" => 0 }
  belongs_to :super_admin, class_name: "User", foreign_key: :user_id

  has_many :admin_memberships, -> { where(role: 1) }, class_name: "Membership"
  has_many :admins, through: :admin_memberships, source: :user
  has_many :member_memberships, -> { where(role: 0) }, class_name: "Membership"
  has_many :members, through: :member_memberships, source: :user

  has_many :memberships
  has_many :users, through: :memberships

  enum game: [:prop_bet]

  def all_members
    users << super_admin
  end
end
