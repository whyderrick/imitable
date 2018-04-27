require "rails_helper"

RSpec.feature "Home page" do
  context "when user is not logged in" do
    scenario "they see text prompting login" do
      visit root_path

      expect(page).to have_text("Sign In")
    end
  end

  context "when user is logged in" do
    scenario "they do not see text prompting login" do
      user = create(:user)

      visit root_path(as: user)

      expect(page).not_to have_text("Sign In")
      expect(page).to have_button("Sign Out")
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
end
