class Job < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :review, optional: true
  has_many :applications
  has_many :users, through: :applications

  def format_to_json
    { id: self.id,
      addressId: self.address_id,
      date: self.date.strftime("%A, %b %d at %I:%M%P"),
      hiredCleaner: self.hired_cleaner_user,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      applicants: self.format_applicants,
      review: self.review ? self.review.format_to_json : nil
    }
  end

  def format_to_json_with_address
    { id: self.id,
      date: self.date.strftime("%A, %b %d at %I:%M%P"),
      hiredCleanerId: self.hired_cleaner,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time,
      address: self.address.format_to_json,
      applicants: self.format_applicants
    }
  end

  def format_applicants
    self.users.map do |applicant| 
      applicant.format_to_json
    end
  end

  def hired_cleaner_user
    user = User.all.find_by_id(self.hired_cleaner)
    user ? user.format_to_json : nil
  end

end
