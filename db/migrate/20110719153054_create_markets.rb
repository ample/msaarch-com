class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :title
      t.string :permalink
      t.string :nav_name
      t.string :color
      t.text :body
      t.references :banner, :logo
      t.integer :sort_order,        :default => 0
      t.integer :projects_count,    :default => 0
      t.boolean :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    create_table :categories_markets, :id => false do |t|
      t.references :category
      t.references :market
    end
  end
end
