class AlterToppings < ActiveRecord::Migration
  def self.up
    rename_column("toppings", "toppings", "toppings")
    remove_column("toppings", "pepperoni")
    remove_column("toppings", "ham")
    remove_column("toppings", "sausage")
    remove_column("toppings", "mushrooms")
    puts "***lawls asdasdfasdfg truck***"
    remove_column("toppings", "green_peppers")
    remove_column("toppings", "pineapple")
  end

  def self.down

  end
end
