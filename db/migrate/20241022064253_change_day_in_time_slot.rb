class ChangeDayInTimeSlot < ActiveRecord::Migration[7.2]
  def change
    change_column :time_slots , :day, :string
  end
end
