class AddGenderToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :gender, :string
  end

  def self.down
    remove_column :club_members, :gender
  end
end
