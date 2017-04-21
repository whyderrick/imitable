class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)

    respond_with @submission
  end
 
  def show
    @submission = Submission.includes(:poems).find(params[:id])
  end
  
  private
  def submission_params
    params.require(:submission).
      permit(:title, :submitted_to, :status, :user_id, poem_ids: [])
  end
end
