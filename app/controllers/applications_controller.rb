class ApplicationsController < ApplicationController
    def create
        job = Job.all.find_by_id(params[:job_id])
        application = job.applications.build(user: current_user)
        if application.save
            render json: {user: current_user.format_to_json}
        else
            render json: {
                errors: address.errors.full_messages
            }
        end
    end
end
