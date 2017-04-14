require 'rails_helper'

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:poems) }
  end
end
