class AddTwitterIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :twitter_id, :string
    add_index :updates, :twitter_id, :unique => true
  end
end
