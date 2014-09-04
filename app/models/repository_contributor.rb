class RepositoryContributor < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :repository

  validate :uniqueness

  def uniqueness
    # TODO: check if user already exists in join table.
  end
end
