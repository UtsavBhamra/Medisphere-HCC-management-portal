class RemoveSeverityFromAppointment < ActiveRecord::Migration[7.2]
  def change
    remove_column :appointments, :severity, :integer
  end
end
