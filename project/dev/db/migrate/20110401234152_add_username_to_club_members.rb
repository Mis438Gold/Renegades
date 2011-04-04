class AddUsernameToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :username, :string
  end

  def self.down
    remove_column :club_members, :username
  end
end
