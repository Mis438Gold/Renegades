class AddRegistrationFieldToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :fully_registered, :boolean
  end

  def self.down
    remove_column :club_members, :fully_registered
  end
end
