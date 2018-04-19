require "rails_helper"

RSpec.feature "Poem management" do
  context "User creates a poem" do
    scenario "and is shown that poem's page when successful" do
      user = create(:user)
      poem_title = "Mr. Mxyzptlk"
      poem_status = Poem::STATUSES.first

      visit root_path(as: user)
      click_on t("poems.actions.new")
      fill_in :poem_title, with: poem_title
      select poem_status, from: :poem_status
      submit_form

      expect(page).to have_flash_message(
        :notice,
        text: "Poem was successfully created",
      )
      expect(page).to have_content(poem_title)
      expect(page).to have_content(poem_status)
      expect(page).to have_content("Submitted to:")
    end

    scenario "and sees a helpful error message when unsuccessful" do
      user = create(:user)
      poem_title = nil

      visit root_path(as: user)
      click_on t("poems.actions.new")
      fill_in :poem_title, with: poem_title
      click_on("Create Poem")

      expect(page).to have_flash_message(
        :alert,
        text: "Poem could not be created",
      )
      within "div.alert-error" do
        expect(page).to have_text("Title can't be blank")
      end
      expect(page).not_to have_content("Submitted to:")
    end
  end

  context "User views a poem's show" do
    scenario "and sees the title and associated submissions" do
      user = create(:user)
      poem = create(:poem)

      submissions = [
        build(:submission, submitted_to: "Split This"),
        build(:submission, submitted_to: "Rock DC"),
      ]
      poem.update(submissions: submissions)

      visit root_path(as: user)
      click_on(poem.title)

      expect(page).to have_text(poem.title)
      expect(page).to have_text(submissions.first.submitted_to)
      expect(page).to have_text(submissions.second.submitted_to)
    end
  end
end
