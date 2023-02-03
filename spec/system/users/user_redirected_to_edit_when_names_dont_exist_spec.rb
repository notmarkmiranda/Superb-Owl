require "rails_helper"

RSpec.describe "Users edit when names do not exist", type: :system do
  let(:user) { create(:user, first_name: nil, last_name: nil, nickname: nil) }

  before { login(user) }

  it "redirects to user#edit when names are missing" do
    visit dashboard_path

    expect(page).to have_content("Edit profile")
    fill_in "First name", with: Faker::Name.first_name
    fill_in "Last name", with: Faker::Name.last_name
    fill_in "Nickname", with: Faker::Superhero.name

    click_button "Update profile"

    expect(page).to have_content("Dashboard")
  end

  it "shows dashboard if the user clicks skip" do
    visit dashboard_path

    click_link "Skip this time"

    expect(page).to have_content("Dashboard")
  end
end
