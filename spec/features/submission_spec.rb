require "rails_helper"

RSpec.feature "User creates a submission" do
  context "with an associated poem that already exists" do
    scenario "and is shown the submission's show page when successful" do
      user = create(:user)
      poem = create(:poem, user: user)
      submission_title = "First Submission"
      submission_status = Submission::STATUSES.first
      submitted_to = "Scary Journal"

      visit root_path(as: user)
      click_on t("submissions.actions.new")
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      check poem.title
      submit_form

      expect(page).to have_flash_message(
        :notice,
        text: "Submission was successfully created.",
      )
      expect(page).to have_text(submission_title)
      expect(page).to have_text(poem.title)
      expect(user.submissions.first.poems.size).to eq(1)
    end
  end

  context "and creates a new poem" do
    scenario "and is shown the submisison's show with the new poem" do
      user = create(:user)
      existing_poem = create(:poem, user: user)
      submission_title = "New Work"
      submission_status = Submission::STATUSES.first
      submitted_to = "Vaunted Journal"
      new_poem_title = "Lyle 2.-"
      poem_status = Poem::STATUSES.first

      visit root_path(as: user)
      click_on t("submissions.actions.new")
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      check existing_poem.title
      fill_in "New Poem Title", with: new_poem_title
      select poem_status, from: "New Poem Status"
      submit_form

      expect(page).to have_text(submission_title)
      expect(page).to have_text(new_poem_title)
      expect(page).to have_flash_message(
        :notice,
        text: "Submission was successfully created.",
      )
      expect(user.submissions.first.poems.size).to eq 2
    end
  end

  context "without selecting a poem" do
    scenario "and is shown the submission's show page" do
      user = create(:user)
      submission_title = "First Submission"
      submission_status = Submission::STATUSES.first
      submitted_to = "Scary Journal"

      visit root_path(as: user)
      click_on t("submissions.actions.new")
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      submit_form

      expect(page).to have_flash_message(
        :notice,
        text: "Submission was successfully created.",
      )
      expect(page).to have_text(submission_title)
    end
  end

  context "with incomplete submission data" do
    scenario "and is shown helpful errors" do
      user = create(:user)
      submission_title = ""
      submission_status = Submission::STATUSES.first
      submitted_to = nil

      visit root_path(as: user)
      click_on t("submissions.actions.new")
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      submit_form

      expect(page).to have_flash_message(
        :alert,
        text: "Submission could not be created.",
      )
      within "div.alert-error" do
        expect(page).to have_text("Title can't be blank")
        expect(page).to have_text("Submitted to can't be blank")
      end
    end
  end
end
