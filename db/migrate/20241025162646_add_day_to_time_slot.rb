class AddDayToTimeSlot < ActiveRecord::Migration[7.2]
  def change
    add_column :time_slots, :day, :integer
  end
end
