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

ActiveRecord::Schema.define(version: 20160906014331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notices", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxons", force: :cascade do |t|
    t.text     "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wenzhangs", force: :cascade do |t|
    t.text     "head"
    t.text     "content"
    t.integer  "taxon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["taxon_id"], name: "index_wenzhangs_on_taxon_id", using: :btree
  end

  create_table "wikis", force: :cascade do |t|
    t.text     "mulu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writings", force: :cascade do |t|
    t.text     "name"
    t.text     "mainbody"
    t.integer  "wiki_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wiki_id"], name: "index_writings_on_wiki_id", using: :btree
  end

  add_foreign_key "wenzhangs", "taxons"
  add_foreign_key "writings", "wikis"
end
