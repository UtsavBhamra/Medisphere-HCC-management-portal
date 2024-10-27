class AddUserIdToHccInCharge < ActiveRecord::Migration[7.2]
  def change
    add_column :hcc_in_charges, :user_id, :integer
  end
end
