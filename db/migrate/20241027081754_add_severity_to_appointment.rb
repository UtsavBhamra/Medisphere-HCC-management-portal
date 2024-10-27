class AddSeverityToAppointment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :severity, :integer
  end
end
