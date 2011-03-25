class Game < ActiveRecord::Base
  #has_many :consoles, :through => :game_consoles
  has_and_belongs_to_many :consoles
  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  
end
