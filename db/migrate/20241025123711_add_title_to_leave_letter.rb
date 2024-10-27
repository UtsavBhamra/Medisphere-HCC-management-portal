class AddTitleToLeaveLetter < ActiveRecord::Migration[7.2]
  def change
    add_column :leave_letters, :title, :string
  end
end
