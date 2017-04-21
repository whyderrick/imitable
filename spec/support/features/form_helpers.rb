module Features
  def submit_form
    find('input[type="submit"][name="commit"]').click
  end
end
