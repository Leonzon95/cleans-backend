class AddEstimatedTimeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :estimated_time, :string
  end
end
