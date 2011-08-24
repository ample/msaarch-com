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

ActiveRecord::Schema.define(:version => 20110824143457) do

  create_table "assets", :force => true do |t|
    t.string   "alt_text"
    t.string   "attachment_uid"
    t.string   "attachment_mime_type"
    t.string   "attachment_ext"
    t.string   "attachment_name"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.string   "keywords"
  end

  create_table "awards", :force => true do |t|
    t.string   "title"
    t.string   "source"
    t.string   "project_name"
    t.integer  "project_id"
    t.integer  "asset_id"
    t.datetime "awarded_date"
    t.integer  "sort_order",   :default => 0
    t.boolean  "active",       :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awards", ["project_id"], :name => "index_awards_on_project_id"

  create_table "blocks", :force => true do |t|
    t.string  "name"
    t.string  "block_type"
    t.string  "body"
    t.integer "page_id"
    t.integer "asset_id"
    t.text    "textarea"
  end

  create_table "careers", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.integer  "user_id"
    t.boolean  "now_hiring"
    t.integer  "sort_order",  :default => 0
    t.boolean  "active",      :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "careers", ["permalink"], :name => "index_careers_on_permalink"
  add_index "careers", ["user_id"], :name => "index_careers_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.integer  "sort_order",         :default => 0
    t.boolean  "active",             :default => false
    t.integer  "projectships_count", :default => 0
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "parent_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["permalink"], :name => "index_categories_on_permalink"

  create_table "categories_markets", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "market_id"
  end

  create_table "events", :force => true do |t|
    t.string   "event_type"
    t.text     "body"
    t.integer  "asset_id"
    t.datetime "event_date"
    t.integer  "sort_order",  :default => 0
    t.boolean  "active",      :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "markets", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.string   "nav_name"
    t.string   "color"
    t.text     "body"
    t.integer  "banner_id"
    t.integer  "logo_id"
    t.integer  "sort_order",         :default => 0
    t.integer  "projectships_count", :default => 0
    t.boolean  "active",             :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text_color"
  end

  add_index "markets", ["permalink"], :name => "index_markets_on_permalink"

  create_table "markets_users", :id => false, :force => true do |t|
    t.integer  "market_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "to_id"
    t.string   "from"
    t.string   "email"
    t.string   "organization"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["to_id"], :name => "index_messages_on_to_id"

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

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "teaser"
    t.text     "body"
    t.integer  "asset_id"
    t.integer  "sort_order",  :default => 0
    t.boolean  "active",      :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["permalink"], :name => "index_posts_on_permalink"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "location"
    t.string   "permalink"
    t.string   "nav_name"
    t.text     "teaser"
    t.text     "body"
    t.integer  "thumbnail_id"
    t.integer  "projectships_count", :default => 0
    t.integer  "sort_order",         :default => 0
    t.boolean  "active",             :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  add_index "projects", ["permalink"], :name => "index_projects_on_permalink"

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projectships", :force => true do |t|
    t.integer  "project_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.boolean  "featured",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.text     "body"
    t.string   "link"
    t.integer  "sort_order",  :default => 0
    t.boolean  "active",      :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "credentials"
    t.string   "permalink"
    t.text     "education"
    t.text     "bio"
    t.boolean  "admin",                                 :default => false
    t.boolean  "active",                                :default => false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "projectships_count"
    t.integer  "asset_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "sort_order",                            :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["permalink"], :name => "index_users_on_permalink"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
