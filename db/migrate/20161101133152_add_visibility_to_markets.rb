class AddVisibilityToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :visible, :boolean, default: true
  end
end
