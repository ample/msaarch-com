class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :to
      t.string :from
      t.string :email
      t.string :organization
      t.string :subject
      t.text :body
      t.timestamps
    end
    add_index :messages, :to_id
  end
end
