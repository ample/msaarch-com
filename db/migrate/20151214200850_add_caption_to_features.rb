class AddCaptionToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :caption, :text
  end
end
