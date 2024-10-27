class AddApprovedToApponintment < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :approved, :boolean
  end
end
