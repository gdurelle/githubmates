require 'geocoder'

class Contributor < ActiveRecord::Base
  include Geocoder::Model::ActiveRecord

  has_many :repository_contributors, class_name: 'RepositoryContributor'
  has_many :repositories, through: :repository_contributors

  validates :github_login, uniqueness: true

  geocoded_by :github_location
  after_validation :geocode, if: ->(obj){ obj.github_location.present? and obj.github_location_changed? }

  scope :with_coordinates, -> { where("latitude IS NOT NULL AND longitude IS NOT NULL") }
  scope :without_coordinates, -> { where(latitude: nil, longitude: nil) }

  def refresh_position
    loc = geocode
    update_attributes latitude: loc.first, longitude: loc.last if loc
  end
end
