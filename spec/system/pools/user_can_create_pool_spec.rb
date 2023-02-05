require "rails_helper"

RSpec.describe "User can create a new pool", type: :system do
  before { login }
  it "creates a new pool and redirects to pool#show" do
    visit dashboard_path

    click_link "New Pool"

    fill_in "Name", with: "Super Duper"

    # LOCK
    within "#pool_lock_1i" do
      find("option[value='2028']").click
    end
    within "#pool_lock_2i" do
      find("option[value='5']").click
    end
    within "#pool_lock_3i" do
      find("option[value='9']").click
    end
    within "#pool_lock_4i" do
      find("option[value='19']").click
    end
    within "#pool_lock_5i" do
      find("option[value='15']").click
    end

    # FINALIZE
    within "#pool_finalize_1i" do
      find("option[value='2028']").click
    end
    within "#pool_finalize_2i" do
      find("option[value='5']").click
    end
    within "#pool_finalize_3i" do
      find("option[value='10']").click
    end
    within "#pool_finalize_4i" do
      find("option[value='12']").click
    end
    within "#pool_finalize_5i" do
      find("option[value='00']").click
    end

    check "pool[multiple_entries]"

    click_button "Create Pool"

    expect(page).to have_content("Super Duper")
  end
end
