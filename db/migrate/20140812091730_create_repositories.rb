class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :github_id, references: nil
      t.string :name
      t.string :github_owner
      t.text :description
      t.boolean :has_issues
      t.boolean :has_wiki

      t.timestamps
    end
  end
end
