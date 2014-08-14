# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140814123826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: true do |t|
    t.string   "github_login"
    t.string   "github_url"
    t.string   "github_avatar_url"
    t.string   "gravatar_id"
    t.string   "github_location"
    t.string   "github_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "repositories", force: true do |t|
    t.string   "github_id"
    t.string   "name"
    t.string   "github_owner"
    t.text     "description"
    t.boolean  "has_issues"
    t.boolean  "has_wiki"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repository_contributors", force: true do |t|
    t.integer "repository_id"
    t.integer "contributor_id"
    t.index ["contributor_id"], :name => "fk__repository_contributors_contributor_id"
    t.index ["repository_id"], :name => "fk__repository_contributors_repository_id"
    t.foreign_key ["contributor_id"], "contributors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_repository_contributors_contributor_id"
    t.foreign_key ["repository_id"], "repositories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_repository_contributors_repository_id"
  end

end
