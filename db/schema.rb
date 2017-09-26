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

ActiveRecord::Schema.define(version: 20170921120627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abidances", force: :cascade do |t|
    t.bigint "fabmoment_id"
    t.bigint "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_abidances_on_fabmoment_id"
    t.index ["license_id"], name: "index_abidances_on_license_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "text"
    t.integer "fabmoment_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["fabmoment_id"], name: "index_comments_on_fabmoment_id"
  end

  create_table "control_panels", force: :cascade do |t|
    t.integer "max_machines_to_occupy"
    t.integer "max_minutes_to_occupy_one_machine"
    t.boolean "open_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controles", force: :cascade do |t|
    t.bigint "fabmoment_id"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_controles_on_fabmoment_id"
    t.index ["program_id"], name: "index_controles_on_program_id"
  end

  create_table "fabmoments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fabmoments_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "fabmoment_id"
    t.bigint "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_feeds_on_fabmoment_id"
    t.index ["material_id"], name: "index_feeds_on_material_id"
  end

  create_table "handles", force: :cascade do |t|
    t.bigint "fabmoment_id"
    t.bigint "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_handles_on_fabmoment_id"
    t.index ["machine_id"], name: "index_handles_on_machine_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machine_occupations", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_occupations_on_machine_id"
    t.index ["user_id"], name: "index_machine_occupations_on_user_id"
  end

  create_table "machine_reservations", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_reservations_on_machine_id"
    t.index ["reservation_id"], name: "index_machine_reservations_on_reservation_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.integer "usage"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.integer "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "approved", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "fabmoments"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "fabmoments", "users"
  add_foreign_key "machine_occupations", "machines"
  add_foreign_key "machine_occupations", "users"
  add_foreign_key "machine_reservations", "machines"
  add_foreign_key "machine_reservations", "reservations"
  add_foreign_key "reservations", "users"
end
