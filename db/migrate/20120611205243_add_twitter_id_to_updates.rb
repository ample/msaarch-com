class AddTwitterIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :twitter_id, :string
    add_column :updates, :publish_to_twitter, :boolean
    add_index :updates, :twitter_id, :unique => true
  end
end
