class AddGravityToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :attachment_gravity, :string
  end
end
