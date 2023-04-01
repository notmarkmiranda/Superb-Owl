require "rails_helper"

RSpec.describe "User can sign in", type: :system do
  let!(:user) { create(:user) }

  it "redirects to dashboard after users signs in" do
    visit sign_in_path

    fill_in "Email Address", with: user.email
    fill_in "Password", with: "password"

    click_button "Sign In"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Welcome, #{user.email}!")
  end
end
