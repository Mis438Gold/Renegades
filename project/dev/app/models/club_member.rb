class ClubMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  
  #devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
 #attr_accessible :email, :password, :password_confirmation, :username,
 #                 :first_name, :last_name, :current_student_status, :gender,
 #                 :gamer_tags

  has_and_belongs_to_many :events
end
