class CreateHccInCharges < ActiveRecord::Migration[7.2]
  def change
    create_table :hcc_in_charges do |t|
      t.timestamps
    end
  end
end
