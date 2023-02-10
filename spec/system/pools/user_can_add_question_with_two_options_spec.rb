require "rails_helper"

RSpec.describe "User can add a question with 2 options to a pool", type: :system do
  let(:pool) { create(:pool, lock: Date.tomorrow) }

  before { login(pool.user) }

  it "redirects back to pool after saving question with choices" do
    question = "Who will win Super Bowl LVII?"

    visit pool_path(pool)

    fill_in "Question description", with: question
    fill_in "Option 1", with: "Philadelphia Eagles"
    fill_in "Option 2", with: "Kansas City Chiefs"

    click_button "Save Question"

    expect(page).to have_content(question)
    expect(page).to have_content(pool.name)
  end

  it "does not save the question with 0 options" do
    question = "Who will win Super Bowl LVII?"

    visit pool_path(pool)

    fill_in "Question description", with: question

    click_button "Save Question"

    expect(page).to have_content(pool.name)
    expect(page).not_to have_content(question)
  end

  it "does not save the question with 1 option" do
    question = "Who will win Super Bowl LVII?"

    visit pool_path(pool)

    fill_in "Question description", with: question
    fill_in "Option 1", with: "Philadelphia Eagles"

    click_button "Save Question"

    expect(page).to have_content(pool.name)
    expect(page).not_to have_content(question)
  end
end
