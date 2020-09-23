class Address < ApplicationRecord
  belongs_to :user
  has_many :jobs
end
