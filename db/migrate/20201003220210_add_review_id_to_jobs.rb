class AddReviewIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :review, null: true, foreign_key: true
  end
end
