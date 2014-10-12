class RepositoryContributor < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :repository

  validates :contributor, uniqueness: { scope: :repository }
end
