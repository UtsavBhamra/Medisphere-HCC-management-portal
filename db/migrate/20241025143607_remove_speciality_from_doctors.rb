class RemoveSpecialityFromDoctors < ActiveRecord::Migration[7.2]
  def change
    remove_column :doctors, :speciality, :integer
  end
end
