class AddAdditionalFavoritesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :additional_favorites, :text
  end
end
