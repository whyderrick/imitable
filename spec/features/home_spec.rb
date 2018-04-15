require "rails_helper"

RSpec.feature "Home page" do
  context "User is not logged in" do
    scenario "and sees log in prompt" do
      visit root_path

      expect(page).to have_text("Login")
    end
  end

  context "User has available poems" do
    scenario "and sees those poems on the home page" do
      poems = build_list(:poem, 2)
      user = create(:user, poems: poems)

      visit root_path(as: user)

      user.poems.each do |poem|
        expect(page).to have_text(poem.title)
      end
    end
  end

  context "User has in-progress submissions" do
    scenario "and sees those submissions on the home page" do
      user = create(:user_with_submissions)

      visit root_path(as: user)

      user.submissions.each do |submission|
        expect(page).to have_text(submission.title)
      end
    end
  end
end
