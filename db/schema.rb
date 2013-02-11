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

ActiveRecord::Schema.define(:version => 20130211164516) do

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
  end

  add_index "movies", ["disc_number"], :name => "index_movies_on_disc_number", :unique => true

  create_table "owners", :force => true do |t|
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

  add_index "owners", ["authentication_token"], :name => "index_owners_on_authentication_token", :unique => true
  add_index "owners", ["email"], :name => "index_owners_on_email", :unique => true

end
