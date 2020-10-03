class ReviewsController < ApplicationController
    before_action :login_required

    def create
        byebug
        user = User.all.find_by_id(parmas[:user_id])
        if user.rating
            user.rating = (params[:review][:rating].to_i + user.rating) / 2 
        else
            user.rating = params[:review][:rating].to_i
        end
        if params[:review][:comment].strip != '' && params[:review][:rating] 
            user.reviews.build(review_params)
        end
        user.save
    end

    private

    def review_params
        parmas.require(:review).permit(:comment, :rating)
    end
end
