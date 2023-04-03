class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :pools
  has_many :admin_memberships, -> { where(role: 1) }, class_name: "Membership"
  has_many :admin_pools, through: :admin_memberships, source: :pool
  has_many :member_memberships, -> { where(role: 0) }, class_name: "Membership"
  has_many :member_pools, through: :member_memberships, source: :pool
end
