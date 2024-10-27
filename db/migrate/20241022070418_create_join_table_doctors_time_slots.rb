class CreateJoinTableDoctorsTimeSlots < ActiveRecord::Migration[7.2]
  def change
    create_join_table :doctors, :time_slots do |t|
      # t.index [:doctor_id, :time_slot_id]
      # t.index [:time_slot_id, :doctor_id]
    end
  end
end
