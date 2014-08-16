require 'rails_helper'

RSpec.describe RepositoriesController, :type => :controller do
  let!(:repository) { FactoryGirl.create :repository, github_owner: 'gdurelle', name: 'githubmates' }

  describe "POST find" do
    context 'with good params' do
      before do
        allow(Repository).to receive(:find_or_create_with_params) { repository }
      end
      it "redirects to the repository" do
        post :find, repository: {name: 'githubmates', github_owner: 'gdurelle'}
        expect(response).to redirect_to repository_path(Repository.last)
      end
    end
    context 'with bad params' do
      before do
        allow(Repository).to receive(:find_or_create_with_params) { Repository.new }
      end
      it 'redirects to home' do
        post :find, repository: {name: '-', github_owner: '-'}
        expect(response).to redirect_to root_path
      end
      it 'should not create a repo' do
        expect{
          post :find, repository: {name: '-', github_owner: '-'}
        }.not_to change(Repository, :count)
      end
    end
  end

  describe "GET show" do
    let!(:contributor) { FactoryGirl.create :contributor }
    before do
      repository.contributors << contributor
    end
    it 'render the show template' do
      get :show, id: repository.id
      expect(response).to render_template :show
    end
    it "assigns the repository" do
      get :show, id: repository.id
      expect(assigns[:repository]).not_to be_nil
    end
    it "build the Google map markers" do
      allow(Gmaps4rails).to receive(:build_markers).with([contributor])
    end
  end

  describe "PATCH refresh" do
    it "calls for github again" do
      VCR.use_cassette 'controller/refresh' do
        allow(repository).to receive(:fill_with_github)
        patch :refresh, id: repository.id
      end
    end
    it "redirects_to" do
      VCR.use_cassette 'controller/refresh' do
        allow(repository).to receive(:fill_with_github) {}
        patch :refresh, id: repository.id
        expect(response).to redirect_to repository_path(repository.id)
      end
    end
  end
end
