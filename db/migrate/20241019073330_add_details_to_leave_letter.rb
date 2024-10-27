class AddDetailsToLeaveLetter < ActiveRecord::Migration[7.2]
  def change
    add_column :leave_letters, :start_date, :date
    add_column :leave_letters, :end_date, :date
  end
end
