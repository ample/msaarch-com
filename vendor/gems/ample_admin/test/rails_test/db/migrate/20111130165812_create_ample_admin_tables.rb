class CreateAmpleAdminTables < ActiveRecord::Migration
  def change
    create_table :assets, :force => true do |t|
      t.string   :keywords
      t.string   :alt_text
      t.string   :attachment_uid
      t.string   :attachment_mime_type
      t.string   :attachment_ext
      t.string   :attachment_name
      t.integer  :attachment_width
      t.integer  :attachment_height
      t.string   :attachment_gravity
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
    create_table :features do |t|
      t.string :title
      t.string :subtitle
      t.string :link
      t.string :feature_type
      t.text :body
      t.references :owner, :polymorphic => true
      t.references :asset
      t.integer :sort_order, :default => 0
      t.boolean :active, :default => false
      t.datetime :active_at, :inactive_at
      t.integer :created_by, :updated_by
      t.timestamps
    end    
  end
end