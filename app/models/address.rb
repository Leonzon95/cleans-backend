class Address < ApplicationRecord
  belongs_to :user
  has_many :jobs

  validates :name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
end
