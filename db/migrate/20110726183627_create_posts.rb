class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.text :teaser
      t.text :body
      t.references :asset
      t.integer  :sort_order,        :default => 0
      t.boolean  :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer  :created_by
      t.integer  :updated_by
      t.timestamps
    end
    add_index :posts, :permalink
  end
end
