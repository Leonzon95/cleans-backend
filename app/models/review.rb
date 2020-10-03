class Review < ApplicationRecord
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true
end
