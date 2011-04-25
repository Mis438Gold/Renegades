class StudentStatuses < ActiveRecord::Base

   has_and_belongs_to_many :club_member

end
