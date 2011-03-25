class Console < ActiveRecord::Base
   #has_many :games, :through => :game_consoles
   has_and_belongs_to_many :games
end
