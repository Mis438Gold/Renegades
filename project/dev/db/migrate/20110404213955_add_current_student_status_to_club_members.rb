class AddCurrentStudentStatusToClubMembers < ActiveRecord::Migration
  def self.up
    add_column :club_members, :current_student_status, :string
  end

  def self.down
    remove_column :club_members, :current_student_status
  end
end
