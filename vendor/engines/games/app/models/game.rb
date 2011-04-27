class Game < ActiveRecord::Base
  #has_many :consoles, :through => :game_consoles
  has_and_belongs_to_many :consoles
  has_and_belongs_to_many :club_members
  has_many :comments
  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  validates :consoles, :presence => true
  validates :description, :presence => true
end
