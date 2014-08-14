class CreateRepositoriesContributors < ActiveRecord::Migration
  def change
    create_table :repository_contributors do |t|
      t.integer :repository_id, references: :repositories
      t.integer :contributor_id, references: :contributors
    end
  end
end
