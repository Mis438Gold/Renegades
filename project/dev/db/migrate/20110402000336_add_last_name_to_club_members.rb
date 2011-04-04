class AddLastNameToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :last_name, :string
  end

  def self.down
    remove_column :club_members, :last_name
  end
end
