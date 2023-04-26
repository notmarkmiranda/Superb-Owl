require 'rails_helper'

RSpec.describe Pool, type: :model do
  it { should belong_to :super_admin }
  it { should have_many :admin_memberships }
  it { should have_many(:admins).through(:admin_memberships) }
  it { should have_many :member_memberships }
  it { should have_many(:members).through(:member_memberships) }
  it { should define_enum_for(:game).with_values([:prop_bet]) }
end
