class Review < ApplicationRecord
    # belongs_to :user, optional: true
    # belongs_to :tutor
    validates :rating, :numericality => {:only_integer => true} 
end
