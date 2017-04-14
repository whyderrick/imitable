RSpec::Matchers.define :have_flash_message do |flash_type|
  match do |page|
    if flash_type.present?
      page.has_css?("div.flash_#{flash_type}")
      within("div.flashes") { page.has_text }
    else
      page.has_css?("div.flashes")
      within("div.flashes") { page.has_text }
    end
  end
end
