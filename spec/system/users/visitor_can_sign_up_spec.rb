require "rails_helper"

RSpec.describe "Visitor can sign up", type: :system do
  let(:email_address) { Faker::Internet.email }

  it "redirects to dashboard after user signs up" do
    visit sign_up_path
    fill_in "Email Address", with: email_address
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"

    click_button "Sign Up"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Welcome, #{email_address}!")
  end
end
