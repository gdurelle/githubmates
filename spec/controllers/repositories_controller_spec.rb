require 'rails_helper'

RSpec.describe RepositoriesController, :type => :controller do

  let!(:repository) {FactoryGirl.create :repository, name: 'rails', github_owner: 'rails'}

  describe "POST find" do
    context 'with good params' do
      it "redirects to the repository" do
        post :find, repository: {name: 'rails', github_owner: 'rails'}
        expect(response).to redirect_to repository_path(Repository.last)
      end
      it "should creates a repo" do
        expect{
          post :find, repository: {name: 'rails', github_owner: 'rails'}
        }.to change(Repository, :count).by(1)
      end
    end
    context 'with bad params' do
      it 'redirects to home' do
        post :find, repository: {name: '-'}
        expect(response).to redirect_to root_path
      end
      it 'should not create a repo' do
        expect{
          post :find, repository: {name: '-'}
        }.not_to change(Repository, :count)
      end
    end
  end

  describe "GET show" do

    it 'render the show template' do
      get :show, id: repository.id
      expect(response).to render_template :show
    end
    it "assigns the repository" do
      get :show, id: repository.id
      expect(assigns[:repository]).not_to be_nil
    end
  end
end
