class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :title
      t.string :source
      t.string :project_name
      t.references :project
      t.references :asset
      t.datetime :awarded_date
      t.integer :sort_order, :default => 0
      t.boolean :active, :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.timestamps
    end
    add_index :awards, :project_id
  end
end
