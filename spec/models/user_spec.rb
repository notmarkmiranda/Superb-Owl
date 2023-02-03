require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should have_many :pools }

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

  describe "#names_complete?" do
    let(:user) { create(:user, first_name: nil, last_name: nil, nickname: nil) }

    describe "returns true" do
      it "when first and last name are present" do
        user.update(first_name: "Mark", last_name: "Miranda")

        expect(user.names_complete?).to eq(true)
      end

      it "when nickname is present" do
        user.update(nickname: Faker::Superhero.name)

        expect(user.names_complete?).to eq(true)
      end
    end

    describe "returns false" do
      it "returns false when a user only has a first name" do
        user.update(first_name: "Mark")

        expect(user.names_complete?).to eq(false)
      end

      it "returns false when a user only has a last name" do
        user.update(last_name: "Miranda")

        expect(user.names_complete?).to eq(false)
      end

      it "returns false when a user has no names" do
        expect(user.names_complete?).to eq(false)
      end
    end
  end
end
