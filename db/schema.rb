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

ActiveRecord::Schema.define(:version => 20130219081535) do

  create_table "borrowers", :force => true do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "loans", :force => true do |t|
    t.integer  "borrower_id"
    t.integer  "movie_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "loans", ["borrower_id"], :name => "index_loans_on_borrower_id"
  add_index "loans", ["movie_id"], :name => "index_loans_on_movie_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "disc_number"
    t.boolean  "watched"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "imdb_id"
    t.text     "tagline"
    t.datetime "release_date"
    t.text     "overview"
    t.string   "image_url"
    t.integer  "tmdb_id"
    t.integer  "user_id"
  end

  add_index "movies", ["disc_number"], :name => "index_movies_on_disc_number", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                :default => "", :null => false
    t.string   "encrypted_password",   :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
