class AddColorToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :color, :string
  end
end
