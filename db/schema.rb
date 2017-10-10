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

ActiveRecord::Schema.define(version: 20170929093131) do

  create_table "abidances", force: :cascade do |t|
    t.integer "fabmoment_id"
    t.integer "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_abidances_on_fabmoment_id"
    t.index ["license_id"], name: "index_abidances_on_license_id"
  end

  create_table "comments", force: :cascade do |t|
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
    t.integer "fabmoment_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_controles_on_fabmoment_id"
    t.index ["program_id"], name: "index_controles_on_program_id"
  end

  create_table "fabmoments", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fabmoments_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.integer "fabmoment_id"
    t.integer "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabmoment_id"], name: "index_feeds_on_fabmoment_id"
    t.index ["material_id"], name: "index_feeds_on_material_id"
  end

  create_table "handles", force: :cascade do |t|
    t.integer "fabmoment_id"
    t.integer "machine_id"
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
    t.integer "machine_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_occupations_on_machine_id"
    t.index ["user_id"], name: "index_machine_occupations_on_user_id"
  end

  create_table "machine_reservations", force: :cascade do |t|
    t.integer "machine_id"
    t.integer "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_reservations_on_machine_id"
    t.index ["reservation_id"], name: "index_machine_reservations_on_reservation_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
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
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "returning_activities", force: :cascade do |t|
    t.integer "weekly_time_table_id"
    t.integer "day"
    t.time "start_time"
    t.time "end_time"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weekly_time_table_id"], name: "index_returning_activities_on_weekly_time_table_id"
  end

  create_table "taggings", force: :cascade do |t|
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

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "usages", force: :cascade do |t|
    t.integer "machine_id"
    t.integer "capacity"
    t.integer "in_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_usages_on_machine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  create_table "weekly_time_tables", force: :cascade do |t|
    t.integer "control_panel_id"
    t.string "title"
    t.string "subtitle"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["control_panel_id"], name: "index_weekly_time_tables_on_control_panel_id"
  end

end
