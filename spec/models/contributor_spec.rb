require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  let(:contributor) { FactoryGirl.create :contributor }
  describe "refresh_position" do
    it "update lat/long attributes" do
      expect(contributor).to receive(:geocode) {[48.858859, 2.3470599]}
      contributor.refresh_position
    end
  end
end
