class CreateTimeSlots < ActiveRecord::Migration[7.2]
  def change
    create_table :time_slots do |t|
      t.date :day
      t.time :begin
      t.time :end

      t.timestamps
    end
  end
end
