class AddMeetingOnlineLinkToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :meeting_online_link, :string
  end
end
