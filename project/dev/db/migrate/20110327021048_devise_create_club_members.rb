class DeviseCreateClubMembers < ActiveRecord::Migration
  def self.up
    create_table(:club_members) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :club_members, :email,                :unique => true
    add_index :club_members, :reset_password_token, :unique => true
    # add_index :club_members, :confirmation_token,   :unique => true
    # add_index :club_members, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :club_members
  end
end
