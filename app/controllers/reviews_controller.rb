class ReviewsController < ApplicationController
    before_action :login_required

    def create
        user = User.all.find_by_id(params[:user_id])
        if user.rating
            user.rating = ((params[:review][:rating].to_i + user.rating) / 2).round
        else
            user.rating = params[:review][:rating].to_i
        end
        if params[:review][:comment].strip != '' && params[:review][:rating] 
            job = Job.find_by_id(params[:job_id])
            review = user.reviews.build(review_params)
            job.review = review
            job.save
        end
        user.save
        render json: {
            user: user.format_to_json
        }
    end

    def index 
        user = User.all.find_by_id(params[:user_id])
        reviews = user.reviews.reverse
        n = params[:fetch_time].to_i * 3
        revs = [];
        revs << reviews[n - 3] if !!reviews[n - 1]
        revs << reviews[n - 2] if !!reviews[n - 2]
        revs << reviews[n - 1] if !!reviews[n - 3]
        sending = revs.map {|rev| rev ? rev.format_to_json : nil }
        if sending.length != 0
            render json: {reviews: sending}
        else 
            render json: {error: "No more reviews"}
        end
    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating)
    end
end
