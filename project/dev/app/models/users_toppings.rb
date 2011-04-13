class UsersToppings < ActiveRecord::Base

  has_many :toppings
  has_many :toppings, :through => :user_toppings
end
