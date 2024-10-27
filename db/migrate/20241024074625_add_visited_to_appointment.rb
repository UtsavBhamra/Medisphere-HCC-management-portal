class AddVisitedToAppointment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :visited, :boolean
  end
end
