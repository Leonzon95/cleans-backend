class JobsController < ApplicationController
    before_action :login_required

    def create 
        job = current_user.jobs.build(job_params)
        job.status = "new"
        if job.save
            render json: {
                job: job.format_to_json
            } 
        else
            render json: {
                errors: job.errors.full_messages
            }
        end
    end

    def index
        if params[:user_id]
            jobs = current_user.jobs.map { |job| job.format_to_json}
            render json: {jobs: jobs}
        else
            jobs = Job.all.map { |job| job.format_to_json}
            render json: {jobs: jobs}
        end
    end

    private

    def job_params
        params.require(:job).permit(:date, :description, :estimated_time, :address_id)
    end
end
