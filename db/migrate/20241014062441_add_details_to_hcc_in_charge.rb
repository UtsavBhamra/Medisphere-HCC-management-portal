class AddDetailsToHccInCharge < ActiveRecord::Migration[7.2]
  def change
    add_column :hcc_in_charges, :staff_id, :string
  end
end
