require 'rails_helper'

feature "Poem management" do
  context "User creates a poem" do
    scenario "and is shown that poem's page when successful" do
      user = create(:user)
      poem_title = "Mr. Mxyzptlk"
      poem_status = "Pending"

      visit root_path(as: user)

      click_on t('poems.actions.new')
      fill_in :poem_title, with: poem_title
      select "Pending", from: :poem_status
      submit_form
      # As written, this test didn't give me a useful error when tried to save
      # the record without including the user_id for the user the poem belongs
      # to on the form. I'm wondering what a better way to write this test would
      # be to realize that the page blew up here in the client.

      expect(page).to have_flash_message(:notice, text: "Poem was created successfully")
      expect(page).to have_content(poem_title)
      expect(page).to have_content(poem_status)
      expect(page).to have_content("Submitted to:")
    end
    
    scenario "and sees a helpful error message when unsuccessful" do
      user = create(:user)
      poem_title = nil

      visit root_path(as: user)

      click_on t('poems.actions.new')
      fill_in :poem_title, with: poem_title
      click_on("Create Poem")

      expect(page).to have_flash_message(:error, text: "Poem was not created successfully")
      expect(page).to have_flash_message(:error, text: "Poem title cannot be blank")
      expect(page).not_to have_content("Submitted to:")
    end 
  end

  def submit_form
    find('input[type="submit"][name="commit"]').click
  end
end
