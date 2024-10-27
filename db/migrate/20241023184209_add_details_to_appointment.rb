class AddDetailsToAppointment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :doctor_id, :integer
    add_column :appointments, :time_slot_id, :integer
  end
end
