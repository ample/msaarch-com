class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :title
      t.string :permalink
      t.string :nav_name
      t.string :color
      t.text :body
      t.references :asset
      t.integer :sort_order,        :default => 0
      t.boolean :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_column :projects, :segment_id, :integer
  end
end
