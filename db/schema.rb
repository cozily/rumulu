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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120330082546) do

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.integer  "age"
    t.string   "gender"
    t.boolean  "has_pets"
    t.boolean  "is_student"
    t.text     "comments"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "disabled",   :default => false, :null => false
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collaborators", :force => true do |t|
    t.integer "room_id"
    t.integer "user_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "application_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "room_id"
    t.string   "image"
    t.string   "caption"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer "user_id"
    t.string  "address"
    t.integer "price"
    t.boolean "utilities_included", :default => false
    t.text    "description"
    t.string  "question_1"
    t.string  "question_2"
    t.string  "question_3"
    t.string  "token"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.boolean  "accepted",       :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
