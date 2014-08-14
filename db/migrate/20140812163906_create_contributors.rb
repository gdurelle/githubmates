class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :github_login
      t.string :github_url
      t.string :github_avatar_url
      t.string :gravatar_id, references: nil
      t.string :github_location
      t.string :github_name

      t.timestamps
    end
  end
end
