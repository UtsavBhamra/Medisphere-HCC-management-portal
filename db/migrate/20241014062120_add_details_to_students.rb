class AddDetailsToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :department, :integer
    add_column :students, :program_type, :integer
    add_column :students, :student_id, :string
  end
end
