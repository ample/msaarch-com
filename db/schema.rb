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

ActiveRecord::Schema.define(version: 20161101133152) do

  create_table "assets", force: :cascade do |t|
    t.string   "alt_text",             limit: 255
    t.string   "attachment_uid",       limit: 255
    t.string   "attachment_mime_type", limit: 255
    t.string   "attachment_ext",       limit: 255
    t.string   "attachment_name",      limit: 255
    t.integer  "attachment_width",     limit: 4
    t.integer  "attachment_height",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",                limit: 255
    t.string   "keywords",             limit: 255
    t.string   "attachment_gravity",   limit: 255
  end

  create_table "awards", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "source",          limit: 255
    t.string   "project_name",    limit: 255
    t.integer  "project_id",      limit: 4
    t.integer  "asset_id",        limit: 4
    t.datetime "awarded_date"
    t.integer  "sort_order",      limit: 4,   default: 0
    t.boolean  "active",                      default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id", limit: 4
  end

  add_index "awards", ["project_id"], name: "index_awards_on_project_id", using: :btree

  create_table "blocks", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.string  "block_type", limit: 255
    t.string  "body",       limit: 255
    t.integer "page_id",    limit: 4
    t.integer "asset_id",   limit: 4
    t.text    "textarea",   limit: 65535
  end

  create_table "careers", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "permalink",   limit: 255
    t.text     "body",        limit: 65535
    t.integer  "user_id",     limit: 4
    t.boolean  "now_hiring"
    t.integer  "sort_order",  limit: 4,     default: 0
    t.boolean  "active",                    default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",    limit: 255
  end

  add_index "careers", ["permalink"], name: "index_careers_on_permalink", using: :btree
  add_index "careers", ["user_id"], name: "index_careers_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "permalink",          limit: 255
    t.integer  "sort_order",         limit: 4,   default: 0
    t.boolean  "active",                         default: false
    t.integer  "projectships_count", limit: 4,   default: 0
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "parent_id",          limit: 4
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["permalink"], name: "index_categories_on_permalink", using: :btree

  create_table "categories_markets", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "market_id",   limit: 4
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_type",  limit: 255
    t.text     "body",        limit: 65535
    t.integer  "asset_id",    limit: 4
    t.datetime "event_date"
    t.integer  "sort_order",  limit: 4,     default: 0
    t.boolean  "active",                    default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "subtitle",     limit: 255
    t.string   "link",         limit: 255
    t.string   "feature_type", limit: 255
    t.text     "body",         limit: 65535
    t.integer  "owner_id",     limit: 4
    t.string   "owner_type",   limit: 255
    t.integer  "asset_id",     limit: 4
    t.integer  "sort_order",   limit: 4,     default: 0
    t.boolean  "active",                     default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id",   limit: 4
    t.text     "caption",      limit: 65535
  end

  create_table "markets", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "permalink",          limit: 255
    t.string   "nav_name",           limit: 255
    t.string   "color",              limit: 255
    t.text     "body",               limit: 65535
    t.integer  "banner_id",          limit: 4
    t.integer  "logo_id",            limit: 4
    t.integer  "sort_order",         limit: 4,     default: 0
    t.integer  "projectships_count", limit: 4,     default: 0
    t.boolean  "active",                           default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text_color",         limit: 255
    t.boolean  "visible",                          default: true
  end

  add_index "markets", ["permalink"], name: "index_markets_on_permalink", using: :btree

  create_table "markets_users", id: false, force: :cascade do |t|
    t.integer  "market_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "to_id",        limit: 4
    t.string   "from",         limit: 255
    t.string   "email",        limit: 255
    t.string   "organization", limit: 255
    t.string   "subject",      limit: 255
    t.text     "body",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["to_id"], name: "index_messages_on_to_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "logo_id",    limit: 4
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "subtitle",          limit: 255
    t.string   "nav_name",          limit: 255
    t.string   "permalink",         limit: 255
    t.string   "meta_keywords",     limit: 255
    t.string   "meta_description",  limit: 255
    t.text     "body",              limit: 65535
    t.boolean  "published",                       default: false
    t.string   "nav_position",      limit: 255
    t.integer  "parent_id",         limit: 4
    t.integer  "sort_order",        limit: 4,     default: 0
    t.string   "template_filename", limit: 255
    t.boolean  "active",                          default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",        limit: 4
    t.integer  "updated_by",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "permalink",   limit: 255
    t.text     "teaser",      limit: 65535
    t.text     "body",        limit: 65535
    t.integer  "asset_id",    limit: 4
    t.integer  "sort_order",  limit: 4,     default: 0
    t.boolean  "active",                    default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.string   "location",           limit: 255
    t.string   "permalink",          limit: 255
    t.string   "nav_name",           limit: 255
    t.text     "teaser",             limit: 65535
    t.text     "body",               limit: 65535
    t.integer  "thumbnail_id",       limit: 4
    t.integer  "projectships_count", limit: 4,     default: 0
    t.integer  "sort_order",         limit: 4,     default: 0
    t.boolean  "active",                           default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords",      limit: 255
    t.string   "meta_description",   limit: 255
  end

  add_index "projects", ["permalink"], name: "index_projects_on_permalink", using: :btree

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projectships", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "owner_id",   limit: 4
    t.string   "owner_type", limit: 255
    t.boolean  "featured",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: :cascade do |t|
    t.text     "body",         limit: 65535
    t.string   "link",         limit: 255
    t.integer  "sort_order",   limit: 4,     default: 0
    t.boolean  "active",                     default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_id",   limit: 255
    t.integer  "media_id",     limit: 4
    t.string   "expanded_url", limit: 255
  end

  add_index "updates", ["twitter_id"], name: "index_updates_on_twitter_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "credentials",            limit: 255
    t.string   "permalink",              limit: 255
    t.text     "education",              limit: 65535
    t.text     "bio",                    limit: 65535
    t.boolean  "admin",                                default: false
    t.boolean  "active",                               default: false
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.integer  "projectships_count",     limit: 4
    t.integer  "asset_id",               limit: 4
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                  limit: 255
    t.integer  "sort_order",             limit: 4,     default: 0
    t.text     "additional_favorites",   limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["permalink"], name: "index_users_on_permalink", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
