class Job < ApplicationRecord
  belongs_to :user
  belongs_to :address

  def format_to_json
    {   id: self.id,
      addressId: self.address_id,
      date: self.date,
      hiredCleanerId: self.hired_cleaner,
      status: self.status,
      description: self.description,
      estimatedTime: self.estimated_time
    }
  end


end
