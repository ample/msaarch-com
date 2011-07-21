class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :permalink
      t.string :nav_name
      t.text :body
      t.references :thumbnail
      t.integer :sort_order,        :default => 0
      t.boolean :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :projects, :permalink
    create_table :projectships do |t|
      t.references :project
      t.references :owner, :polymorphic => true
      t.timestamps
    end
  end
end
