require 'rails_helper'

RSpec.describe Pool, type: :model do
  it { should belong_to :super_admin }
  it { should have_many :memberships }
  it { should define_enum_for(:game).with_values([:prop_bet]) }
end
