class RemoveNameFromAppointments < ActiveRecord::Migration[7.2]
  def change
    remove_column :appointments, :name, :string
  end
end
