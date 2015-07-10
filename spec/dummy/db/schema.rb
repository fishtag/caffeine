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

ActiveRecord::Schema.define(version: 20150604131323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "caffeine_admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "caffeine_admin_users", ["email"], name: "index_caffeine_admin_users_on_email", unique: true, using: :btree
  add_index "caffeine_admin_users", ["reset_password_token"], name: "index_caffeine_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "caffeine_node_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "caffeine_node_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "node_anc_desc_udx", unique: true, using: :btree
  add_index "caffeine_node_hierarchies", ["descendant_id"], name: "node_desc_idx", using: :btree

  create_table "caffeine_nodes", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "position"
    t.hstore   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "caffeine_nodes", ["slug"], name: "index_nodes_on_slug", using: :btree

  create_table "caffeine_pictures", force: :cascade do |t|
    t.string   "image_id"
    t.string   "image_filename"
    t.string   "image_content_type"
    t.integer  "image_size"
    t.string   "caption"
    t.text     "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "position"
  end

  add_index "caffeine_pictures", ["imageable_type", "imageable_id"], name: "index_caffeine_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "seo_data", force: :cascade do |t|
    t.integer  "datable_id"
    t.string   "datable_type"
    t.string   "meta_keywords"
    t.string   "meta_title"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_data", ["datable_type", "datable_id"], name: "index_seo_data_on_datable_type_and_datable_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
