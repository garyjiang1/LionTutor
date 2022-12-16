class AddUserIdToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :user_id, :integer
  end
end
