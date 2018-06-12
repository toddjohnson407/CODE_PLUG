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

ActiveRecord::Schema.define(version: 2018_06_12_100737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.bigint "user_id"
    t.bigint "review_id"
    t.integer "hours"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["course_id"], name: "index_bookings_on_course_id"
    t.index ["review_id"], name: "index_bookings_on_review_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "price"
    t.string "rate"
    t.text "description"
    t.string "address"
    t.string "city"
    t.integer "rating_average"
    t.bigint "subject_id"
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.string "learning"
    t.string "requirement"
    t.string "documents"
    t.string "video"
    t.string "vimeo_file"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "available_hours"
    t.bigint "user_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_credits_on_course_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "attachement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.integer "rating"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.boolean "teacher", default: false
    t.string "phone_number"
    t.string "location"
    t.string "current_position"
    t.string "languages"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "courses"
  add_foreign_key "bookings", "reviews"
  add_foreign_key "bookings", "users"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "users"
  add_foreign_key "credits", "courses"
  add_foreign_key "credits", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
