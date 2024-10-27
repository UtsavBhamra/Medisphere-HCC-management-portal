class AddStudentIdToAppointment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :student_id, :integer
  end
end
