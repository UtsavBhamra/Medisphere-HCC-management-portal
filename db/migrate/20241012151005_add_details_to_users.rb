class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :department, :integer
    add_column :users, :program_type, :integer
    add_column :users, :student_id, :string
    add_column :users, :staff_id, :string
  end
end
