class CreateStudentStatuses < ActiveRecord::Migration
  def self.up
    create_table :student_statuses do |t|

      t.timestamps
      t.string :StudentStatus
    end
  end

  def self.down
    drop_table :student_statuses
  end
end
