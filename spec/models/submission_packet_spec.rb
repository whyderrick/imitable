require "rails_helper"

RSpec.describe SubmissionPacket do
  describe "associations" do
    it { is_expected.to belong_to(:submission) }
    it { is_expected.to belong_to(:poem) }
    it { is_expected.to accept_nested_attributes_for(:poem) }
  end
end
