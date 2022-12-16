class Meeting < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :tutor, foreign_key: 'tutor_id'
    validates :title, presence: true
    validates :description, presence: true
    validates :meeting_location, presence: true
    validates :meeting_online_link, presence: true
    validates :start_time, :end_time, presence: true
end
