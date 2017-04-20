RSpec::Matchers.define :have_flash_message do |flash_type, options|
  message = options[:text]
  match do |page|
    if flash_type.present?
      page.has_css?("div.flash-#{flash_type}", text: message)
    else
      page.has_css?("div.flashes", text: message)
    end
  end
end
