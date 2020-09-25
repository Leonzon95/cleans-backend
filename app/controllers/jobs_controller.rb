class JobsController < ApplicationController
    before_action :login_required

    def create 
        job = current_user.jobs.build(job_params)
        if job.save
            render json: {
                job: {
                    id: job.id,
                    addressId: job.address_id,
                    date: job.date,
                    hiredCleanerId: job.hired_cleaner,
                    status: 'new',
                    description: job.description,
                    estimatedTime: job.estimated_time
                }
            } 
        else
            render json: {
                errors: job.errors.full_messages
            }
        end
    end

    def index
        jobs = current_user.jobs.map do |job|
            {   id: job.id,
                addressId: job.address_id,
                date: job.date,
                hiredCleanerId: job.hired_cleaner,
                status: job.status,
                description: job.description,
                estimatedTime: job.estimated_time
            }
        end
        render json: {jobs: jobs}
    end

    private

    def job_params
        params.require(:job).permit(:date, :description, :estimated_time, :address_id)
    end
end
