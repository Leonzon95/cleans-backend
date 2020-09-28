class Address < ApplicationRecord
  belongs_to :user
  has_many :jobs

  validates :name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :street_address, presence: true


  def format_to_json
    { id: self.id,
      name: self.name,
      country: self.country,
      state: self.state,
      zipcode: self.zipcode,
      city: self.city,
      streetAddress: self.street_address
    }
  end
end
