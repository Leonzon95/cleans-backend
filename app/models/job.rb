class Job < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :applications
  has_many :users, through: :applications

  def format_to_json
    {  id: self.id,
      addressId: self.address_id,
      date: self.date,
      hiredCleanerId: self.hired_cleaner,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      applicants: self.formmat_applicants
    }
  end

  def format_to_json_with_address
    { id: self.id,
      date: self.date,
      hiredCleanerId: self.hired_cleaner,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      address: self.address.format_to_json,
      applicants: self.formmat_applicants
    }
  end

  def formmat_applicants
    self.users.map do |applicant| 
      {  id: self.id,
            username: self.username,
            email: self.email,
            firstName: self.first_name,
            lastName: self.last_name,
            isCleaner: self.is_cleaner,
            phoneNumber: self.phone_number,
            hourlyRate: self.hourly_rate
        }
    end
  end

end
