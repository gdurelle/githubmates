require 'rails_helper'

RSpec.describe ContributorsController, :type => :controller do

  let!(:repository) { FactoryGirl.create :repository, name: 'rails', github_owner: 'rails' }
  let!(:contributor) { FactoryGirl.create :contributor }

  before do
    repository.contributors << contributor
  end

  describe "GET refresh_position" do
    it "redirects to the repo" do
      patch :refresh_position, id: contributor.id, from: repository.id
      expect(response).to redirect_to repository_path(repository.id)
    end
  end

end
