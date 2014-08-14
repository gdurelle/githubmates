class Contributor < ActiveRecord::Base
  has_many :repository_contributors, class_name: 'RepositoryContributor'
  has_many :repositories, through: :repository_contributors

  validates :github_login, uniqueness: true

  geocoded_by :github_location
  after_validation :geocode
end
