class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :reason
      t.datetime :preferred_slot
      t.string :severity

      t.timestamps
    end
  end
end
