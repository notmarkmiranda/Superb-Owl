require "rails_helper"

RSpec.describe "User can create a pool", type: :system do
  before { login }

  let(:pool_name) { "Superb Owl 2023 - Mark Miranda" }

  it "creates a pool and redirects back to the pool" do
    visit dashboard_path

    click_link "Create Pool"
    fill_in "Name", with: pool_name

    select "Prop Bet", from: "pool[game]"
    check('Publicly viewable?', allow_label_click: true)
    click_button "Create Pool"

    expect(page).to have_content(pool_name)
  end
end
