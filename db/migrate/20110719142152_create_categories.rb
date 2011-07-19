class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :sort_order,        :default => 0
      t.boolean :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
