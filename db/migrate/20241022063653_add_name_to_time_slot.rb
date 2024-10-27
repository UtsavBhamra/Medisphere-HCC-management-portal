class AddNameToTimeSlot < ActiveRecord::Migration[7.2]
  def change
    add_column :time_slots, :name, :string
  end
end
