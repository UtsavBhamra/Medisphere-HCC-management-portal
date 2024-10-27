class CreateLeaveLetters < ActiveRecord::Migration[7.2]
  def change
    create_table :leave_letters do |t|
      t.integer :student_id
      t.integer :appointment_id
      t.string :applicant_response
      t.integer :status
      t.integer :current_step

      t.timestamps
    end
  end
end
