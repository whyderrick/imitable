require 'rails_helper'

RSpec.feature "Submissions" do
  context "User creates a submission" do
    scenario "and is shown the submission's show page when successful" do
      user = create(:user)
      poem = create(:poem, user: user)
      submission_title = "First Submission"
      submission_status = Submission::SUBMISSION_STATUSES.first
      submitted_to = "Scary Journal"
      
      visit root_path(as: user)
      click_on t('submissions.actions.new')
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      check poem.title
      submit_form

      expect(page).to have_flash_message(
        :notice,
        text: "Submission was successfully created."
      )
      expect(page).to have_text(submission_title)
      expect(page).to have_text(poem.title)
    end

    scenario "and is shown a helpful error when providing incomplete data" do
      user = create(:user)
      submission_title = ""
      submission_status = Submission::SUBMISSION_STATUSES.first
      submitted_to = nil

      visit root_path(as: user)
      click_on t('submissions.actions.new')
      fill_in :submission_title, with: submission_title
      fill_in :submission_submitted_to, with: submitted_to
      select submission_status, from: :submission_status
      submit_form

      expect(page).to have_flash_message(
        :alert,
        text: "Submission could not be created."
      )
      within "div.alert-error" do
        expect(page).to have_text("Title can't be blank")
        expect(page).to have_text("Submitted to can't be blank")
      end
    end
  end

  def go_to_submission_form
    click_on t('submissions.actions.new')
  end

  def fill_out_submission_form
    fill_in :submission_title, with: submission_title
    fill_in :submission_submitted_to, with: submitted_to
    fill_in :submission_status, with: submission_status
    check poem.title
  end
end

