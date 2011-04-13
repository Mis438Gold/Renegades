class Toppings < ActiveRecord::Base

  has_many :user_toppings
  has_many :toppings, :through => :user_toppings
end
