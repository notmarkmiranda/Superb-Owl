require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }

  describe "#generate_code" do
    let(:user) { create(:user, confirmation_code: nil, confirmation_expiration: nil) }

    it "generates a code and sets the expiration" do
      user.generate_code

      expect(user.confirmation_code).not_to eq(nil)
      expect(user.confirmation_expiration).to be_within(2.minutes).of 15.minutes.from_now
    end
  end

  describe "#confirm?" do
    let(:user) { create(:user, confirmation_code: "ASDF", confirmation_expiration: DateTime.tomorrow) }

    it "returns true when a confirmation code matches and is not expired" do
      expect(user.confirm?("ASDF")).to eq(true)
    end

    it "returns false when the code does not match" do
      expect(user.confirm?("FDSA")).to eq(false)
    end

    it "returns false when the code is expired" do
      user.update(confirmation_expiration: DateTime.yesterday)

      expect(user.confirm?("ASDF")).to eq(false)
    end
  end
end
