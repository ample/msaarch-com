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

ActiveRecord::Schema.define(:version => 20111130165812) do

  create_table "assets", :force => true do |t|
    t.string   "keywords"
    t.string   "alt_text"
    t.string   "attachment_uid"
    t.string   "attachment_mime_type"
    t.string   "attachment_ext"
    t.string   "attachment_name"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.string   "attachment_gravity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.string  "name"
    t.string  "block_type"
    t.string  "body"
    t.integer "page_id"
    t.integer "asset_id"
    t.text    "textarea"
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "link"
    t.string   "feature_type"
    t.text     "body"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "asset_id"
    t.integer  "sort_order",   :default => 0
    t.boolean  "active",       :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "nav_name"
    t.string   "permalink"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.text     "body"
    t.boolean  "published",         :default => false
    t.string   "nav_position"
    t.integer  "parent_id"
    t.integer  "sort_order",        :default => 0
    t.string   "template_filename"
    t.boolean  "active",            :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                                 :default => false
    t.boolean  "active",                                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end