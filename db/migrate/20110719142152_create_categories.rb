class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :sort_order,         :default => 0
      t.boolean :active,             :default => false
      t.integer :projectships_count, :default => 0
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    create_table :groups do |t|
      t.string :title
      t.boolean :active,            :default => false
      t.integer :sort_order,        :default => 0
      t.integer :categories_count,  :default => 0
      t.timestamps
    end
    create_table :categories_groups, :id => false do |t|
      t.references :category
      t.references :group
    end
  end
end
