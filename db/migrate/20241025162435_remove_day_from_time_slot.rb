class RemoveDayFromTimeSlot < ActiveRecord::Migration[7.2]
  def change
    remove_column :time_slots, :day, :integer
  end
end
