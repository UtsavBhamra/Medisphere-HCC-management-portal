class AddDetailsToDeanStudentWelfare < ActiveRecord::Migration[7.2]
  def change
    add_column :dean_student_welfares, :staff_id, :string
  end
end
