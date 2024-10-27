class RemovePreferredSlotFromAppointment < ActiveRecord::Migration[7.2]
  def change
    remove_column :appointments, :preferred_slot, :datetime
  end
end
