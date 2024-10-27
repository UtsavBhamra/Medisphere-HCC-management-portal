class CreateDeanStudentWelfares < ActiveRecord::Migration[7.2]
  def change
    create_table :dean_student_welfares do |t|
      t.timestamps
    end
  end
end
