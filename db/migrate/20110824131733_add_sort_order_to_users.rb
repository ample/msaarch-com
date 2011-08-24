class AddSortOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sort_order, :integer, :default => 0
  end
end
