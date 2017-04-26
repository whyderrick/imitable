require "rails_helper"

RSpec.describe SubmissionPacket do
  describe "associations" do
    it { is_expected.to belong_to(:submission) }
    it { is_expected.to belong_to(:poem) }
  end
end
