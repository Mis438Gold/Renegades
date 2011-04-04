class AddFirstNameToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :first_name, :string
  end

  def self.down
    remove_column :club_members, :first_name
  end
end
