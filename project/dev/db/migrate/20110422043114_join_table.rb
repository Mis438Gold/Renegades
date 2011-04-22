class JoinTable < ActiveRecord::Migration
  def self.up
    create_table :club_members_toppings, :id => false do |t|
      t.integer "club_member_id"
      t.integer "topping_id"
    end
    add_index :club_members_toppings, ["club_member_id", "topping_id"]
  end

  def self.down
  end
end
