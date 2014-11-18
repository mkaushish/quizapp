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

ActiveRecord::Schema.define(version: 20141118133520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "description"
    t.boolean  "checked"
    t.integer  "points_c"
    t.integer  "points_w"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "answers", ["deleted_at"], name: "index_answers_on_deleted_at", using: :btree

  create_table "questions", force: true do |t|
    t.text     "description"
    t.integer  "type"
    t.boolean  "grading"
    t.boolean  "survey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "title"
  end

  add_index "questions", ["deleted_at"], name: "index_questions_on_deleted_at", using: :btree

  create_table "quiz_questions", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.integer  "serial_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "row_order"
  end

  add_index "quiz_questions", ["deleted_at"], name: "index_quiz_questions_on_deleted_at", using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "quizzes", ["deleted_at"], name: "index_quizzes_on_deleted_at", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "question_id"
    t.integer  "points"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "quiz_id"
    t.integer  "user_quiz_id"
    t.integer  "row_order"
  end

  add_index "responses", ["deleted_at"], name: "index_responses_on_deleted_at", using: :btree

  create_table "user_answers", force: true do |t|
    t.integer  "response_id"
    t.integer  "points"
    t.integer  "answer_id"
    t.boolean  "correct"
    t.boolean  "checked"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "user_answers", ["deleted_at"], name: "index_user_answers_on_deleted_at", using: :btree

  create_table "user_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "user_questions", ["deleted_at"], name: "index_user_questions_on_deleted_at", using: :btree

  create_table "user_quizzes", force: true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.integer  "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "question_id"
  end

  add_index "user_quizzes", ["deleted_at"], name: "index_user_quizzes_on_deleted_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
