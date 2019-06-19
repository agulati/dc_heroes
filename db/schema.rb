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

ActiveRecord::Schema.define(version: 2019_06_17_014037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "type"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_attributes_on_abbreviation", unique: true
  end

  create_table "character_attributes", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "attribute_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_character_attributes_on_attribute_id"
    t.index ["character_id"], name: "index_character_attributes_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "initiative"
    t.integer "hero_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_nodes", force: :cascade do |t|
    t.integer "x_index"
    t.integer "x_min"
    t.integer "x_max"
    t.integer "y_index"
    t.integer "y_min"
    t.integer "y_max"
    t.integer "value"
    t.bigint "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_table_nodes_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "type"
    t.string "x_label"
    t.string "y_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_attributes", "attributes"
  add_foreign_key "character_attributes", "characters"
  add_foreign_key "table_nodes", "tables"
end
