class AddMediaToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :media_id, :integer
    add_column :updates, :expanded_url, :string
  end
end
