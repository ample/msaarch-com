class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :first_name
      t.string :last_name
      t.string :credentials
      t.string :permalink
      t.text :education
      t.text :bio
      t.boolean :admin, :default => false
      t.boolean :active, :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.integer :projectships_count
      t.references :asset

      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :permalink
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
