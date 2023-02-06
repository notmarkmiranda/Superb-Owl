require "rails_helper"

RSpec.describe Pool, type: :model do
  before { create(:pool) }
  it { should belong_to :user }
  it { should have_many :questions }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).case_insensitive }

  let(:pool) { create(:pool, lock: DateTime.now) }

  describe "#locked?" do
    it "returns true when the current time is after the lock time" do
      allow(Time).to receive(:current).and_return(DateTime.tomorrow)

      expect(pool.locked?).to eq(true)
    end

    it "returns false when the current time is prior to the lock time" do
      allow(Time).to receive(:current).and_return(DateTime.yesterday)

      expect(pool.locked?).to eq(false)
    end
  end
end
