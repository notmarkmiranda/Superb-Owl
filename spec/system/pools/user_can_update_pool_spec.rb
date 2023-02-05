require "rails_helper"

RSpec.describe "User can update a pool", type: :system do
  let(:pool) { create(:pool, multiple_entries: false, name: "Super Duper", lock: DateTime.tomorrow, finalize: DateTime.tomorrow, active: true) }

  before { login(pool.user) }

  describe "if the current_time is after the lock time" do
    before { pool.update(lock: DateTime.yesterday) }

    it "does not display a link to edit the pool" do
      visit pool_path(pool)

      expect(page).to have_content(pool.name)
      expect(page).not_to have_link("Edit Pool")
    end
  end

  describe "if the current_time is after the finalize time" do
    before { pool.update(finalize: DateTime.yesterday) }

    it "does not display a link to edit the pool" do
      visit pool_path(pool)

      expect(page).to have_content(pool.name)
      expect(page).not_to have_link("Edit Pool")
    end
  end

  describe "if the pool is no longer active" do
    before { pool.update(active: false) }

    it "does not display a link to edit the pool" do
      visit pool_path(pool)

      expect(page).to have_content(pool.name)
      expect(page).not_to have_link("Edit Pool")
    end
  end

  describe "if the current_time is before the lock and finalize time and the pool is active" do
    before { pool.update(lock: DateTime.tomorrow) }

    it "updates the pool" do
      visit pool_path(pool)

      click_link "Edit Pool"

      fill_in "Name", with: "New Name"
      check "pool[multiple_entries]"

      click_button "Update Pool"
    end
  end
end
