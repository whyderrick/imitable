class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params_with_user)

    respond_with @submission
  end

  def show
    @submission = Submission.includes(:poems).find(params[:id])
  end

  private

  def submission_params
    params.require(:submission).permit(
      :title,
      :submitted_to,
      :status,
      poem_ids: [],
    )
  end

  def submission_params_with_user
    submission_params.merge(user_id: current_user.id)
  end
end
