class HomeController < ApplicationController
  def index
    submissions = current_user&.submissions
    poems = current_user&.poems

    render "index", locals: { submissions: submissions, poems: poems }
  end
end
