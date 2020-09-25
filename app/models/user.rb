class User < ApplicationRecord
    has_many :addresses
    has_many :jobs
    has_many :applications
    # has_many :jobs, through: :applications, as: :applied_jobs

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :phone_number, presence: true
    validates :password, length: { minimum: 6 }
   
    

    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
