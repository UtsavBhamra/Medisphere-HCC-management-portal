class AddUserIdToDeanStudentWelfare < ActiveRecord::Migration[7.2]
  def change
    add_column :dean_student_welfares, :user_id, :integer
  end
end
