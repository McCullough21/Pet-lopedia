# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_13_190331) do

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "female_height_min"
    t.string "female_height_max"
    t.string "male_height_min"
    t.string "male_height_max"
    t.string "female_weight_min"
    t.string "female_weight_max"
    t.string "male_weight_min"
    t.string "male_weight_max"
    t.string "description"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "description"
    t.integer "user_id"
    t.integer "breed_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "qualification"
  end

end
