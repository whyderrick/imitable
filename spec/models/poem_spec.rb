require 'rails_helper'

RSpec.describe Poem do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:submissions).through(:submission_packets) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
