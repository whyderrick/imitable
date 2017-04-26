require "rails_helper"

RSpec.describe Submission do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:submitted_to) }
    it do
      is_expected.to validate_inclusion_of(:status).
        in_array(Submission::SUBMISSION_STATUSES)
    end
  end

  describe "assocations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:poems).through(:submission_packets) }
  end
end
