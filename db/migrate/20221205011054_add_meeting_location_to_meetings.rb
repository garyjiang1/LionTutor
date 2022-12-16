class AddMeetingLocationToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :meeting_location, :string
  end
end
