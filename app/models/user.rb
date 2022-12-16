class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tutors
  has_many :reviews, dependent: :destroy
  has_many :meetings, dependent: :destroy
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :email, presence: true
end
