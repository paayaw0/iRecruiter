# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_21_101441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_trackings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_trackings_on_candidate_id"
    t.index ["user_id"], name: "index_candidate_trackings_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "employment_status"
    t.string "work_mode"
    t.string "linkedin_profile"
    t.string "github_profile"
    t.string "personal_website"
    t.string "current_location"
    t.string "social_network_profiles"
    t.string "hiring_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_employer"
    t.string "sex"
    t.integer "years_of_experience"
    t.integer "experience_level"
  end

  create_table "educational_backgrounds", force: :cascade do |t|
    t.string "name_of_school"
    t.string "qualification"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "courses"
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_educational_backgrounds_on_candidate_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "industry"
    t.integer "years_worked"
    t.string "job_title"
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_employers_on_candidate_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_projects_on_candidate_id"
  end

  create_table "social_media_profiles", force: :cascade do |t|
    t.string "name_of_platform"
    t.string "social_media_handle"
    t.string "url"
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_social_media_profiles_on_candidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "recruiter", default: false
  end

  add_foreign_key "candidate_trackings", "candidates"
  add_foreign_key "candidate_trackings", "users"
  add_foreign_key "educational_backgrounds", "candidates"
  add_foreign_key "employers", "candidates"
  add_foreign_key "projects", "candidates"
  add_foreign_key "social_media_profiles", "candidates"
end
