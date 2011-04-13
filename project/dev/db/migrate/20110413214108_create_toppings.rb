class CreateToppings < ActiveRecord::Migration
  def self.up
    create_table :toppings do |t|


      t.string :toppings
    end
  end

  def self.down
    drop_table :toppings
  end
end
