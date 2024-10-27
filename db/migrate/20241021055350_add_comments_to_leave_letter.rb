class AddCommentsToLeaveLetter < ActiveRecord::Migration[7.2]
  def change
    add_column :leave_letters, :hcc_comments, :text
    add_column :leave_letters, :dsw_comments, :text
  end
end
