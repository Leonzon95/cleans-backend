class Review < ApplicationRecord
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true

  def format_to_json
    {rating: self.rating, comment: self.comment}
  end
end
