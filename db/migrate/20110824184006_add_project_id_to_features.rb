class AddProjectIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :project_id, :integer
  end
end
