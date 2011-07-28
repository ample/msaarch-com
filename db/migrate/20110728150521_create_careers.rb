class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :title
      t.string :permalink
      t.text :body
      t.references :user
      t.boolean :now_hiring
      t.integer  :sort_order,        :default => 0
      t.boolean  :active,            :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer  :created_by
      t.integer  :updated_by
      t.timestamps
    end
    add_index :careers, :user_id
    add_index :careers, :permalink
    create_table :markets_users, :id => false do |t|
      t.references :market
      t.references :user
      t.timestamps
    end
  end
end
