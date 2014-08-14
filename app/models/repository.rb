class Repository < ActiveRecord::Base
  has_many :repository_contributors, class_name: 'RepositoryContributor'
  has_many :contributors, through: :repository_contributors, class_name: 'Contributor'

  validates :name, :github_owner, presence: true
  validates :github_id, uniqueness: true

  def self.find_or_create_with_params(repository_params)
    repository = Repository.find_or_initialize_by(repository_params)
    return repository unless repository.new_record?
    repository.fill_with_github
    repository.save! unless repository.errors.any?
    repository
  end

  def fill_with_github
    begin
      @github = Github.new oauth_token: Rails.application.secrets.github_app_token
      get_repo_infos
      get_contributors
    rescue Github::Error::Forbidden => e
      errors.add(:github, "Github API rate limit exceeded (403). Please retry later.")
    end
  end

  private

  def get_repo_infos
    repo = @github.repos.get user: github_owner, repo: name
    self.github_id = repo.id
    self.description = repo.description
    self.has_issues = repo.has_issues
    self.has_wiki = repo.has_wiki
    self.created_at = repo.created_at
    self.updated_at = repo.updated_at
  end

  def get_contributors
    contributors = @github.repos.contributors user: github_owner, repo: name
    contributors.each do |contributor|
      get_user_infos_for(contributor)
    end
  end

  def get_user_infos_for(github_contributor)
    user = @github.users.get user: github_contributor.login
    contributors << Contributor.find_or_initialize_by(github_login: github_contributor.login) do |contributor|
      contributor.github_url = user.try(:url)
      contributor.github_avatar_url = user.try(:avatar_url)
      contributor.gravatar_id = user.try(:gravatar_id)
      contributor.github_location = user.try(:location)
      contributor.github_name = user.try(:name)
    end
  end
end
