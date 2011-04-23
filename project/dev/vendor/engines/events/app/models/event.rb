class Event < ActiveRecord::Base

  belongs_to :event_type
  acts_as_indexed :fields => [:Title, :description]
  has_and_belongs_to_many :club_members
  validates :Title, :presence => true, :uniqueness => true
  
end
