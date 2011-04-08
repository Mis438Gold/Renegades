class AddGamerTagsToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :gamer_tags, :string
  end

  def self.down
    remove_column :club_members, :gamer_tags
  end
end
