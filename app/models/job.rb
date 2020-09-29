class Job < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :applications
  has_many :users, through: :applications

  def format_to_json
    { id: self.id,
      addressId: self.address_id,
      date: self.date,
      hiredCleaner: self.hired_cleaner_user,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      applicants: self.format_applicants
    }
  end

  def format_to_json_with_address
    { id: self.id,
      date: self.date,
      hiredCleaner: self.hired_cleaner_user,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      address: self.address.format_to_json,
      applicants: self.format_applicants
    }
  end

  def format_applicants
    self.users.map do |applicant| 
      {  id: applicant.id,
            username: applicant.username,
            email: applicant.email,
            firstName: applicant.first_name,
            lastName: applicant.last_name,
            isCleaner: applicant.is_cleaner,
            phoneNumber: applicant.phone_number,
            hourlyRate: applicant.hourly_rate
        }
    end
  end

  def hired_cleaner_user
    cleaner_id = self.hired_cleaner
    User.all.find_by_id(cleaner_id)
  end

end
