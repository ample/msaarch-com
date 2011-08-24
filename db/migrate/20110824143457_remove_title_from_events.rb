class RemoveTitleFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :title
  end

  def down
    add_column :events, :title, :string
  end
end
