class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :permalink
      t.string :nav_name
      t.text :body
      t.references :asset
      t.integer :sort_order,        :default => 0
      t.boolean :active,            :default => false
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :categories, :permalink
  end
end
