class AddReviewIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :review, index: true
  end
end
