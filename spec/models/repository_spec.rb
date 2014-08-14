require 'rails_helper'

RSpec.describe Repository, :type => :model do

  let!(:repository) {FactoryGirl.create :repository, name: 'githubmates', github_owner: 'gdurelle'}
  params = {name: 'githubmates', github_owner: 'sgdurelle'}

  before do
    repository.instance_variable_set(:@github, Github.new(oauth_token: Rails.application.secrets.github_app_token))
  end

  describe '::find_or_create_with_params' do
    it "create or find a new Repository" do
      expect(Repository).to receive(:find_or_initialize_by) { Repository.new(params) }
      expect_any_instance_of(Repository).to receive(:fill_with_github)
      expect_any_instance_of(Repository).to receive(:save!)
      Repository.find_or_create_with_params(params)
    end
  end

  describe '.fill_with_github' do
    it "calls initialize github api client and use it." do
      expect(Github).to receive(:new).with(oauth_token: Rails.application.secrets.github_app_token)
      expect(repository).to receive(:get_repo_infos)
      expect(repository).to receive(:get_contributors)
      repository.fill_with_github
    end
  end

  describe '#get_repo_infos' do
    it 'calls Github API through its client to get repo infos' do
      VCR.use_cassette 'model/github_repo' do
        repository.send(:get_repo_infos)
      end
    end
  end

  describe '#get_contributors' do
    it "calls Github API to get contributors of the repo" do
      VCR.use_cassette 'model/github_contributors' do
        expect_any_instance_of(Repository).to receive(:get_user_infos_for)
        repository.send(:get_contributors)
      end
    end
  end

  describe '#get_user_infos_for' do
    it "calls Github API to get user infos." do
      VCR.use_cassette 'model/github_user' do
        repository.send(:get_user_infos_for, double(login: 'gdurelle'))
      end
    end
  end
end
