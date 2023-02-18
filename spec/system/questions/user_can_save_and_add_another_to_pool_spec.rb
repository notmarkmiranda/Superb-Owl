require "rails_helper"

RSpec.describe "User can Save & Add Another question to a pool", type: :system do
  let(:pool) { create(:pool, lock: Date.tomorrow) }

  before { login(pool.user) }

  it do
    question_1 = "Who will win Super Bowl LVII?"

    visit pool_path(pool)

    fill_in "Question description", with: question_1
    fill_in "Option 1", with: "Philadelphia Eagles"
    fill_in "Option 2", with: "Kansas City Chiefs"
    check "Tiebreaker"

    click_button "Save Question"

    expect(page).to have_content(question_1)
    expect(page).to have_content(pool.name)

    question_2 = "Who will lose Super Bowl LVII?"

    fill_in "Question description", with: question_2
    fill_in "Option 1", with: "Philadelphia Eagles"
    fill_in "Option 2", with: "Kansas City Chiefs"
    click_button "Save Question"

    expect(page).to have_content(question_1)
    expect(page).to have_content(question_2)
    expect(page).to have_content(pool.name)
  end
end
