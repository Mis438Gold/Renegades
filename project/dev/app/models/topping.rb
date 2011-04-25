class Topping < ActiveRecord::Base

 has_and_belongs_to_many :club_members
end
