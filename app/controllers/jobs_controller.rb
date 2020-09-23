class JobsController < ApplicationController
    
    def create 
        job = Job.new(job_params)
        if job.save
            render json: {
                job: {
                    id: job.id,
                    addressId: job.address_id,
                    date: job.date,
                    hiredCleanerId: job.hired_cleaner,
                    status: 'new',
                    description: job.description,
                    estimatedTime: estimated_time
                }
            }
        end
    end

    private

    def job_params
        params.require(:job).permit(:date, :description, :estimated_time)
    end
end
