class AddLatitudeAndLongitudeToContributor < ActiveRecord::Migration
  def change
    add_column :contributors, :latitude, :float
    add_column :contributors, :longitude, :float
  end
end
