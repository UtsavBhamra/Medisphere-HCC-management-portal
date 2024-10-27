class AddCommentsToAppointment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :hcc_comments, :text
  end
end
