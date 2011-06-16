class CreateAmpleAdminTables < ActiveRecord::Migration
  
  def self.up
    
    create_table :assets, :force => true do |t|
      t.string   :alt_text
      t.string   :attachment_uid
      t.string   :attachment_mime_type
      t.string   :attachment_ext
      t.string   :attachment_name    
      t.integer  :attachment_width
      t.integer  :attachment_height
      t.timestamps
    end

    create_table :blocks, :force => true do |t|
      t.string  :name
      t.string  :block_type
      t.string  :body
      t.integer :page_id
      t.integer :asset_id
      t.text    :textarea
    end

    create_table :pages, :force => true do |t|
      t.string   :title
      t.string   :subtitle
      t.string   :nav_name
      t.string   :permalink
      t.string   :meta_keywords
      t.string   :meta_description
      t.text     :body
      t.boolean  :published,         :default => false
      t.string   :nav_position
      t.integer  :parent_id
      t.integer  :sort_order,        :default => 0
      t.string   :template_filename
      t.boolean  :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer  :created_by
      t.integer  :updated_by
      t.timestamps
    end
    
    add_index :pages, [:permalink], :name => "index_pages_on_permalink"
    
    create_table :users, :force => true do |t|
      t.string   "email",                               :default => "",    :null => false
      t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
      t.string   "password_salt",                       :default => "",    :null => false
      t.string   "reset_password_token"
      t.string   "remember_token"
      t.datetime "remember_created_at"
      t.boolean  "admin",                               :default => false
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "permalink"
      t.integer  "failed_attempts",                     :default => 0
      t.string   "unlock_token"
      t.datetime "locked_at"
    end
    
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true


  end

  def self.down
    drop_table :assets
    drop_table :blocks
    drop_table :pages
    drop_table :users
  end
  
end