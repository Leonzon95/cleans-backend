class User < ApplicationRecord
    has_many :addresses
    has_many :jobs
    has_many :applications
    has_many :reviews

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :phone_number, presence: true
    validates :password, length: { minimum: 6 }, on: :create
   
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    def format_to_json
        {  id: self.id,
            username: self.username,
            email: self.email,
            firstName: self.first_name,
            lastName: self.last_name,
            isCleaner: self.is_cleaner,
            phoneNumber: self.phone_number,
            hourlyRate: self.hourly_rate,
            rating: self.rating
        }
    end
end
