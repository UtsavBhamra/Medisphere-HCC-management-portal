class ChangeNullConstraintsInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :role, false
    change_column_null :users, :department, false
    change_column_null :users, :program_type, false
  end
end
