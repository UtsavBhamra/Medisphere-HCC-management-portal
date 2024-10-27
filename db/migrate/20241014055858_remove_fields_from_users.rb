class RemoveFieldsFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :department, :integer
    remove_column :users, :program_type, :integer
    remove_column :users, :student_id, :string
    remove_column :users, :staff_id, :string
  end
end
