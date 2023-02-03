require "rails_helper"

RSpec.describe "Visitor can sign up", type: :system do
  it "redirects a user to the dashboard when they successfully sign in" do
    allow_any_instance_of(User).to receive(:confirm?).and_return(true)

    visit "/lets-go"

    fill_in "Email Address", with: "superduper+visitor@example.com"
    click_button "Let's Go!"

    expect(page).to have_content("Enter Confirmation Code")
    fill_in "Confirmation Code", with: "ASDF"

    click_button "Log In"

    expect(page).to have_content("Edit profile")
  end
end
