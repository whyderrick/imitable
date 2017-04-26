class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(new_submission_params)

    respond_with @submission
  end

  def show
    @submission = Submission.includes(:poems).find(params[:id]) ||
      Submission.new
  end

  private

  def submission_params
    params.require(:submission).
      permit(:title, :submitted_to, :status, poem_ids: [])
  end

  def new_submission_params
    submission_params.merge(user_id: current_user.id)
  end
end
