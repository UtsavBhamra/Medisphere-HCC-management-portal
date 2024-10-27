class AddSpecialityToDoctor < ActiveRecord::Migration[7.2]
  def change
    add_column :doctors, :speciality, :integer
  end
end
