class MemeberEvent < ActiveRecord::Migration
  def self.up
    create_table :members_events do |t|
      t.integer :club_member_ID
      t.integer :event_ID
    end
    add_index :members_events, :event_ID
    add_index :members_events, :club_member_ID
  end

  def self.down
    drop_table :members_events
  end
end
