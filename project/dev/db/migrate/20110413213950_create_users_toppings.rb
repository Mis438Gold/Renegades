class CreateUsersToppings < ActiveRecord::Migration
  def self.up
    create_table :users_toppings, :id => false do |t|

    t.integer "toppings_id"
    t.integer "user_id"
    end
    add_index :users_toppings, ["toppings_id", "user_id"]
  end

  def self.down
    drop_table :users_toppings
  end
end
