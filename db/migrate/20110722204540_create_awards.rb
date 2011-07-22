class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :source
      t.string :project_name
      t.references :project
      t.datetime :awarded_date

      t.timestamps
    end
    add_index :awards, :project_id
  end
end
