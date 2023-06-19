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

ActiveRecord::Schema[7.0].define(version: 2023_06_17_220215) do
  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "compaigns", force: :cascade do |t|
    t.string "title"
    t.text "purpose"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expert_id"
  end

  create_table "discussion_topics", force: :cascade do |t|
    t.string "title"
    t.integer "compaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "novice_id"
    t.index ["compaign_id"], name: "index_discussion_topics_on_compaign_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "compaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supertag_id"
    t.index ["compaign_id"], name: "index_tags_on_compaign_id"
  end

  create_table "to_dos", force: :cascade do |t|
    t.text "task"
    t.string "status"
    t.integer "compaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["compaign_id"], name: "index_to_dos_on_compaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "username"
    t.string "email"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profession"
    t.string "service"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "discussion_topics", "compaigns"
  add_foreign_key "tags", "compaigns"
  add_foreign_key "to_dos", "compaigns"
end
