class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.create(submission_params)
    @submission.persisted? && @submission.poems.create(extract_poem_params)

    respond_with @submission
  end

  def show
    @submission = Submission.includes(:poems).find(params[:id])
  end

  private

  def submission_params
    extract_poem_params
    params.require(:submission).permit(
      :title,
      :submitted_to,
      :status,
      poem_ids: [],
    )
  end

  def extract_poem_params
    @_poem_params ||= params[:submission].delete(:poem)
    @_poem_params.permit(:title, :status).merge(user_id: current_user.id)
  end
end
