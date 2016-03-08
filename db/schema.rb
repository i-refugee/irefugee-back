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

ActiveRecord::Schema.define(version: 20160308142803) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "center_keywords", force: :cascade do |t|
    t.integer  "center_id"
    t.integer  "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "center_keywords", ["center_id"], name: "index_center_keywords_on_center_id"
  add_index "center_keywords", ["keyword_id"], name: "index_center_keywords_on_keyword_id"

  create_table "center_needs", force: :cascade do |t|
    t.integer  "center_id"
    t.integer  "need_id"
    t.text     "description"
    t.integer  "importance"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "center_needs", ["center_id"], name: "index_center_needs_on_center_id"
  add_index "center_needs", ["need_id"], name: "index_center_needs_on_need_id"

  create_table "centers", force: :cascade do |t|
    t.text     "description"
    t.string   "address"
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password_digest"
    t.string   "contact_email"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "center_type"
    t.integer  "refugees_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.string   "slug"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "need_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keywords", ["keyword"], name: "index_keywords_on_keyword"
  add_index "keywords", ["need_id"], name: "index_keywords_on_need_id"

  create_table "needs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsfeeds", force: :cascade do |t|
    t.string   "content"
    t.integer  "center_id"
    t.string   "model"
    t.integer  "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "center_id"
    t.string   "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "statuses", ["center_id"], name: "index_statuses_on_center_id"

  create_table "tokens", force: :cascade do |t|
    t.integer  "center_id"
    t.integer  "admin_id"
    t.string   "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["admin_id"], name: "index_tokens_on_admin_id"
  add_index "tokens", ["auth_token"], name: "index_tokens_on_auth_token", unique: true
  add_index "tokens", ["center_id"], name: "index_tokens_on_center_id"

  create_table "visibles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
