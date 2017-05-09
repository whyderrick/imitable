require "rails_helper"

RSpec.describe Submission do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:submitted_to) }
    it do
      is_expected.to validate_inclusion_of(:status).
        in_array(Submission::STATUSES)
    end
  end

  describe "assocations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:poems).through(:submission_packets) }
    it { is_expected.to accept_nested_attributes_for(:submission_packets) }
  end

  describe "#deep_blank?" do
    context "when all of the attributes have no value" do
      it "returns true" do
        attributes = {
          submission_packet_attributes: {
            poem_attributes: {
              title: "",
              status: nil,
            },
          },
        }

        expect(Submission.new.deep_blank?(attributes)).to eq true
      end
    end

    context "when an attribute has a value" do
      it "returns false" do
        attributes = {
          submission_packet_attributes: {
            poem_attributes: {
              title: :bar_baby,
              status: nil,
            },
          },
        }

        expect(Submission.new.deep_blank?(attributes)).to eq false
      end
    end
  end
end
