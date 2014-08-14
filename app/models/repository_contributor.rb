class RepositoryContributor < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :repository
end
