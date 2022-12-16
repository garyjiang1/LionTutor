class AddTutorIdToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :tutor_id, :integer
    add_index :meetings, :tutor_id
  end
end
