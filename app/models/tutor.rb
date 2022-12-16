class Tutor < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews
    has_many :meetings, foreign_key: 'tutor_id'
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
    validates :phone, presence: true
    validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
    validates :bio, presence: true
end
