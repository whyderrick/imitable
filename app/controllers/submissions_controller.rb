class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    @submission.build_poem
  end

  def create
    @submission = current_user.submissions.build(submission_params)
    # Slightly problematic because it creates duplication. Unless the app allows
    # users to collaborate, a poem owner will always be a packet owner and will
    # always be a submission owner. No quick fix available, but bears chewing
    # on.
    @submission.submission_packets.each do |packet|
      packet.poem.user_id = current_user.id
    end

    @submission.save
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
      submission_packets_attributes: [
        poem_attributes: [:title, :status],
      ],
    )
  end
end
