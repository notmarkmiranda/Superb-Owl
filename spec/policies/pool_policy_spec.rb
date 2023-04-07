require 'rails_helper'

RSpec.describe PoolPolicy, type: :policy do
  let(:pool) { create(:pool, public_pool: public_pool) }
  let(:user) { create(:user) }
  let(:policy) { described_class.new(user, pool) }

  describe "show?" do
    describe "public pool" do
      let(:public_pool) { true }

      it "returns true for a public pool" do
        expect(policy.show?).to eq(true)
      end
    end

    describe "private pool" do
      let(:public_pool) { false }

      it "returns true when the user is a member of the pool" do
        create(:membership, :member, user: user, pool: pool)

        expect(policy.show?).to eq(true)
      end

      it "returns false when the user is not a member of the pool" do
        expect(policy.show?).to eq(false)
      end
    end
  end
end
