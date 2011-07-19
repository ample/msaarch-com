class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :permalink
      t.string :nav_name
      t.text :body
      t.integer :sort_order,        :default => 0
      t.boolean :active,            :default => false
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :projects, :permalink
    create_table :categories_projects, :id => false do |t|
      t.references :category
      t.references :project
    end
  end
end
