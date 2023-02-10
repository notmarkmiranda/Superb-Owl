require "rails_helper"

RSpec.describe "User cannot add questions to a locked pool", type: :system do
  let(:pool) { create(:pool, lock: 1.hour.ago) }
  before { login(pool.user) }

  it "does not show the fields to add a question" do
    visit pool_path(pool)

    expect(page).not_to have_content("Question description")
  end
end
